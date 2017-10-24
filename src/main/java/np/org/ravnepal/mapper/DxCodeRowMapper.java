package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.DxCode;

import org.springframework.jdbc.core.RowMapper;

public class DxCodeRowMapper implements RowMapper<DxCode> {

	public DxCode mapRow(ResultSet rs, int rowNum) throws SQLException {
		DxCode dxCode = new DxCode();
		dxCode.setId(rs.getLong("id"));

		dxCode.setDxCode(rs.getString("dxcode"));
		dxCode.setDxDesc(rs.getString("description"));
		dxCode.setHcc(rs.getString("hcc"));
		dxCode.setDxCombined();
		return dxCode;
	}

}
