package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.Claim;
import np.org.ravnepal.model.Provider;

import org.springframework.jdbc.core.RowMapper;

public class ClaimRowMapper implements RowMapper<Claim> {

	public Claim mapRow(ResultSet rs, int rowNum) throws SQLException {

		Claim claim = new Claim();
		claim.setId(rs.getLong("cid"));
		claim.setComment(rs.getString("comment"));
		claim.setStatus(rs.getInt("status"));
		claim.setCodingDate((rs.getString("coding_date")));
		claim.setDateOfService(rs.getString("date_of_service"));
		claim.setClaimId(rs.getString("claim_id"));
		claim.setChartId(rs.getLong("chart_id"));
		claim.setReviewed(rs.getBoolean("reviewed"));
		claim.setInsertType(rs.getString("insert_type"));

		Provider provider = new Provider();
		provider.setId(rs.getLong("pid"));
		provider.setFullName(rs.getString("pFullName"));
		provider.setNpi(rs.getString("npi"));
		
		claim.setProvider(provider);
		
		return claim;
	}
}
