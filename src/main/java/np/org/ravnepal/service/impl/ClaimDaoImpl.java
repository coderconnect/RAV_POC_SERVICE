package np.org.ravnepal.service.impl;

import java.util.ArrayList;
import java.util.List;

import np.org.ravnepal.mapper.ClaimRowMapper;
import np.org.ravnepal.model.Claim;
import np.org.ravnepal.response.ClaimStatus;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.ClaimDao;
import np.org.ravnepal.service.HelperService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ClaimDaoImpl implements ClaimDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	HelperService helperService = new HelperServiceImpl();

	@Override
	public List<Claim> getClaimsByUserId(long userId) {

		List<Claim> claimList = new ArrayList<Claim>();

		String sql = "SELECT c.id as cid, c.chart_id, c.insert_type, c.claim_id, c.comment, c.status, to_char(c.date_of_service, 'MM/DD/YYYY') as date_of_service, to_char(c.coding_date,'MM/DD/YYYY') as coding_date, c.reviewed, p.id as pid, p.full_name as pFullName, p.npi from chart_claims c, providers p where c.provider_id = p.id and c.status in (0,2) and c.chart_id = (select chart_id from active_charts where user_id = ?) order by c.date_of_service asc";

		try {
			claimList = jdbcTemplate.query(sql, new Object[] { userId },
					new ClaimRowMapper());
			return claimList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public Status updateClaimComment(Claim claim) {

		String updateSql = "Update chart_claims set comment = ? where claim_id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { claim.getComment(), claim.getClaimId() });

		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status changeReviewState(Claim claim) {
		String updateSql = "Update chart_claims set reviewed = ? where claim_id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { claim.isReviewed(), claim.getClaimId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status addClaim(Claim claim) {
		String addSql = "Insert into chart_claims (chart_id, claim_id, comment, date_of_service, coding_date, provider_id, reviewed, insert_type) VALUES(?,?,?,to_date(?, 'MM/DD/YYYY'),to_date(?, 'MM/DD/YYYY'),?,?,?)";

		int status = jdbcTemplate.update(
				addSql,
				new Object[] { claim.getChartId(), claim.getClaimId(),
						claim.getComment(), claim.getDateOfService(),
						claim.getCodingDate(), claim.getProvider().getId(),
						claim.isReviewed(), "New" });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);
	}

	@Override
	public ClaimStatus getClaimStatus(Claim claim) {
		// String sql = "Select * from chart_claims"
		return null;
	}

	@Override
	public Status setClaimStatus(Claim claim) {

		String updateSql = "Update chart_claims set status = ? where claim_id = ?";
		int status = jdbcTemplate.update(updateSql,
				new Object[] { claim.getStatus(), claim.getClaimId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status updateDOS(Claim claim) {

		if (helperService.isFutureDate(claim.getDateOfService())) {
			return new Status(false);
		}
		
		String updateSql = "Update chart_claims set date_of_service = to_date(?, 'MM/DD/YYYY') , insert_type = ? where claim_id = ?";
		int status = jdbcTemplate.update(
				updateSql,
				new Object[] { claim.getDateOfService(), "Changed",
						claim.getClaimId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);
	}

}
