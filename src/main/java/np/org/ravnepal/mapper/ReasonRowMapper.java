package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.Reason;

import org.springframework.jdbc.core.RowMapper;

public class ReasonRowMapper implements RowMapper<Reason> {

	public Reason mapRow(ResultSet rs, int rowNum) throws SQLException {
		Reason reason = new Reason();
		reason.setId(rs.getLong("id"));
		
		reason.setStatement(rs.getString("name"));
	
		return reason;
	}
}
