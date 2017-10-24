package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.CptCode;

import org.springframework.jdbc.core.RowMapper;

public class CptCodeRowMapper implements RowMapper<CptCode> {

	public CptCode mapRow(ResultSet rs, int rowNum) throws SQLException {
		CptCode cptCode = new CptCode();
		cptCode.setId(rs.getLong("id"));

		cptCode.setCptCode(rs.getString("cptcode"));
		cptCode.setCptDesc(rs.getString("description"));
		cptCode.setCptCombined();
		return cptCode;
	}
}
