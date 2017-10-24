package np.org.ravnepal.service.impl;

import java.util.ArrayList;
import java.util.List;

import np.org.ravnepal.mapper.DxClaimRowMapper;
import np.org.ravnepal.model.DxClaim;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.DxClaimDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DxClaimDaoImpl implements DxClaimDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public List<DxClaim> getDxClaimsbyId(String claimId) {

		List<DxClaim> claimList = new ArrayList<DxClaim>();
		String sql = "" + "SELECT dxc.*, " + "       dx.id       AS dxid, "
				+ "       dx.dxcode, " + "       dx.description, dx.hcc, "
				+ "       p.id        AS pid, "
				+ "       p.full_name AS pFullName, " + "       p.npi "
				+ "FROM   dx_claims dxc, " + "       dx_codes dx, "
				+ "       providers p, chart_claims cc "
				+ "WHERE  dxc.dx_id = dx.id "
				+ "       AND cc.provider_id = p.id "
				+ "		  AND dxc.claim_id =  cc.claim_id"
				+ "       AND dxc.claim_id = ? order by dxc.id ASC";

		try {
			claimList = jdbcTemplate.query(sql, new Object[] { claimId },
					new DxClaimRowMapper());
			return claimList;
		} catch (EmptyResultDataAccessException e) {
			return null;

		}
	}

	@Override
	public Status changeInvalidState(DxClaim dxClaim) {
		String updateSql = "Update dx_claims set invalid = ? where id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { dxClaim.isInvalid(), dxClaim.getId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status addComment(DxClaim dxClaim) {
		String updateSql = "Update dx_claims set comment = ? where id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { dxClaim.getComment(), dxClaim.getId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status addDxClaim(DxClaim dxClaim) {

		String findSql = "Select count(dx_id) from dx_claims where claim_id = ? and dx_id = ?";

		int count;

		try {
			count = (int) getJdbcTemplate().queryForObject(
					findSql,
					new Object[] { dxClaim.getClaimId(),
							dxClaim.getDxCode().getId() }, Integer.class);
		} catch (EmptyResultDataAccessException e) {
			count = -1;
		}

		if (count > 0) {
			return new Status(false);
		}

		String sql = "Insert into dx_claims (claim_id, dx_id, invalid, comment, status, insert_type) VALUES(?,?,?,?,?,?)";

		int status = jdbcTemplate.update(sql,
				new Object[] { dxClaim.getClaimId(),
						dxClaim.getDxCode().getId(), dxClaim.isInvalid(),
						dxClaim.getComment(), dxClaim.getStatus(), "New" });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status setReason(DxClaim dxClaim) {
		String updateSql = "Update dx_claims set reason_id = ? where id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { dxClaim.getReasonId(), dxClaim.getId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

}
