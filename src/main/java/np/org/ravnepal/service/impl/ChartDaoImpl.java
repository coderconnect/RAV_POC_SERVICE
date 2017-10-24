package np.org.ravnepal.service.impl;

import java.util.ArrayList;
import java.util.List;

import np.org.ravnepal.mapper.ChartRowMapper;
import np.org.ravnepal.mapper.ReasonRowMapper;
import np.org.ravnepal.model.Chart;
import np.org.ravnepal.model.Reason;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.ChartDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDaoImpl implements ChartDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public Chart getChartById(long userId) {
		String sql = "SELECT c.* FROM   charts c, active_charts ac "
				+ "WHERE  ac.user_id = ? " + "AND c.id = ac.chart_id; ";

		Chart chart = (Chart) getJdbcTemplate().queryForObject(sql,
				new Object[] { userId }, new ChartRowMapper());

		return chart;
	}

	@Override
	public boolean moveToNextChart(long userId) {

		Chart chart = new Chart();
		// new
		String getSql = "SELECT * FROM charts c WHERE c.id not in (select chart_id from user_charts uc) and c.id not in (select chart_id from active_charts) order by name limit 1";

		chart = jdbcTemplate.queryForObject(getSql, new ChartRowMapper());

		// Insert sql

		String insertSql = "Insert into user_charts (chart_id, user_id) values (?,?)";
		jdbcTemplate.update(insertSql, new Object[] { chart.getId(), userId });

		String updateSql = "INSERT INTO active_charts (user_id, chart_id) VALUES(? , ?) ON CONFLICT (user_id) DO UPDATE SET chart_id=?";
		int status = jdbcTemplate.update(updateSql, new Object[] { userId,
				chart.getId(), chart.getId() });

		if (status > 0) {
			return true;
		}

		return false;
	}

	@Override
	public List<Reason> getCannotReviewList() {

		List<Reason> reasonList = new ArrayList<Reason>();
		String sql = "SELECT * from cannot_review_messages";

		try {
			reasonList = jdbcTemplate.query(sql, new ReasonRowMapper());
			return reasonList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public List<Reason> getReasonsList() {
		List<Reason> reasonList = new ArrayList<Reason>();
		String sql = "SELECT * from reasons";

		try {
			reasonList = jdbcTemplate.query(sql, new ReasonRowMapper());
			return reasonList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

	@Override
	public Status updateChartComment(Chart chart) {
		String updateSql = "Update Charts set comment = ? where id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { chart.getComment(), chart.getId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);
	}

	@Override
	public Status updateCannotReview(Chart chart) {

		String userSql = "Select user_id from active_charts where chart_id = ?";

		long userId;
		try {
			userId = (long) getJdbcTemplate().queryForObject(userSql,
					new Object[] { chart.getId() }, Long.class);
		} catch (EmptyResultDataAccessException e) {
			userId = -1;
		}

		String updateSql = "Update Charts set reason_id = ? , status = ? where id = ?";

		jdbcTemplate.update(updateSql, new Object[] { chart.getReasonId(), 3,
				chart.getId() });

		Chart chart1 = new Chart();
		// new
		String getSql = "SELECT * FROM charts c WHERE c.id not in (select chart_id from user_charts uc) and c.id not in (select chart_id from active_charts) order by name limit 1";

		chart1 = jdbcTemplate.queryForObject(getSql, new ChartRowMapper());

		// Insert sql

		String insertSql = "Insert into user_charts (chart_id, user_id) values (?,?)";
		jdbcTemplate.update(insertSql, new Object[] { chart1.getId(), userId });

		String updateSql1 = "INSERT INTO active_charts (user_id, chart_id) VALUES(? , ?) ON CONFLICT (user_id) DO UPDATE SET chart_id=?";
		int status = jdbcTemplate.update(updateSql1, new Object[] { userId,
				chart1.getId(), chart1.getId() });

		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status completeChart(Chart chart) {
		String updateSql = "Update Charts set status = 1 where id = ?";

		int status = jdbcTemplate.update(updateSql,
				new Object[] { chart.getId() });
		if (status > 0) {
			return new Status(true);
		}

		return new Status(false);

	}

	@Override
	public Status saveForLater(Chart chart) {
		// TODO Auto-generated method stub
		return null;
	}
}
