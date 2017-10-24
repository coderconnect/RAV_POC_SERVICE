package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.DxClaim;
import np.org.ravnepal.model.DxCode;
import np.org.ravnepal.model.Provider;

import org.springframework.jdbc.core.RowMapper;

public class DxClaimRowMapper implements RowMapper<DxClaim> {

	public DxClaim mapRow(ResultSet rs, int rowNum) throws SQLException {

		DxClaim dxClaim = new DxClaim();
		
		
		dxClaim.setId(rs.getLong("id"));
		dxClaim.setComment(rs.getString("comment"));
		dxClaim.setStatus(rs.getInt("status"));
		dxClaim.setClaimId(rs.getString("claim_id"));
		dxClaim.setReasonId(rs.getInt("reason_id"));
		dxClaim.setInvalid(rs.getBoolean("invalid"));
		dxClaim.setInsertType(rs.getString("insert_type"));
		
		Provider provider = new Provider();
		provider.setId(rs.getLong("pid"));
		provider.setFullName(rs.getString("pFullName"));
		provider.setNpi(rs.getString("npi"));

		dxClaim.setProvider(provider);
		
		DxCode dxCode = new DxCode();
		dxCode.setId(rs.getLong("dxId"));
		dxCode.setDxCode(rs.getString("dxcode"));
		dxCode.setDxDesc(rs.getString("description"));
		dxCode.setHcc(rs.getString("hcc"));
		
		dxClaim.setDxCode(dxCode);
		
		return dxClaim;
	}
}
