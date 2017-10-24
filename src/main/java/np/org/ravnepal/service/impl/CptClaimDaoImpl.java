package np.org.ravnepal.service.impl;

import java.util.ArrayList;
import java.util.List;

import np.org.ravnepal.mapper.CptClaimRowMapper;
import np.org.ravnepal.model.CptClaim;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.CptClaimDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CptClaimDaoImpl implements CptClaimDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public List<CptClaim> getCptClaimsbyId(String claimId) {

		List<CptClaim> claimList = new ArrayList<CptClaim>();
		String sql = "" + "SELECT cptc.*, " + "       cpt.id       AS cptId, "
				+ "       cpt.cptcode, " + "       cpt.description "
				+ "FROM   cpt_claims cptc, " + "       cpt_codes cpt "
				+ "WHERE  cptc.cpt_id = cpt.id "
				+ "       AND cptc.claim_id = ? order by cptc.id ASC";

		try {
			claimList = jdbcTemplate.query(sql, new Object[] { claimId },
					new CptClaimRowMapper());
			return claimList;
		} catch (EmptyResultDataAccessException e) {
			return null;

		}
	}

	@Override
	public Status addCptClaim(CptClaim cptClaim) {

		String findSql = "Select count(cpt_id) from cpt_claims where claim_id = ? and cpt_id = ?";

		int count;

		try {
			count = (int) getJdbcTemplate().queryForObject(
					findSql,
					new Object[] { cptClaim.getClaimId(),
							cptClaim.getCptCode().getId() }, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			count = -1;
		}

		if (count > 0) {
			return new Status(false);
		}

		String sql = "Insert into cpt_claims (claim_id, cpt_id, modifiers, comment, insert_type) VALUES(?,?,?,?,?)";

		int status = jdbcTemplate.update(sql,
				new Object[] { cptClaim.getClaimId(),
						cptClaim.getCptCode().getId(), cptClaim.getModifiers(),
						cptClaim.getComment(), "New" });

		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status addComment(CptClaim cptClaim) {
		String updateSql = "Update cpt_claims set comment = ? where id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { cptClaim.getComment(), cptClaim.getId() });

		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}
}
