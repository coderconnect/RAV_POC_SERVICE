package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.Chart;

import org.springframework.jdbc.core.RowMapper;

public class ChartRowMapper implements RowMapper<Chart> {

	public Chart mapRow(ResultSet rs, int rowNum) throws SQLException {
		Chart chart = new Chart();
		chart.setId(rs.getLong("id"));
		chart.setMemberId(rs.getLong("member_id"));
		chart.setName(rs.getString("name"));
		chart.setComment(rs.getString("comment"));
		chart.setProviderId(rs.getLong("provider_id"));
		chart.setReasonId(rs.getInt("reason_id"));
		chart.setStatus(rs.getInt("status"));
		chart.setUri(rs.getString("uri"));
	
		return chart;
	}
}
