package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.CptClaim;
import np.org.ravnepal.model.CptCode;

import org.springframework.jdbc.core.RowMapper;

public class CptClaimRowMapper implements RowMapper<CptClaim> {

	public CptClaim mapRow(ResultSet rs, int rowNum) throws SQLException {

		CptClaim cptClaim = new CptClaim();

		cptClaim.setId(rs.getLong("id"));
		cptClaim.setComment(rs.getString("comment"));
		cptClaim.setClaimId(rs.getString("claim_id"));
		cptClaim.setModifiers(rs.getString("modifiers"));
		cptClaim.setInsertType(rs.getString("insert_type"));
		
		CptCode cptCode = new CptCode();
		cptCode.setId(rs.getLong("cptId"));
		cptCode.setCptCode(rs.getString("cptcode"));
		cptCode.setCptDesc(rs.getString("description"));

		cptClaim.setCptCode(cptCode);

		return cptClaim;
	}
}
