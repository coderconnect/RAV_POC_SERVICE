package np.org.ravnepal.service.impl;

import np.org.ravnepal.mapper.ChartRowMapper;
import np.org.ravnepal.mapper.UserRowMapper;
import np.org.ravnepal.model.Chart;
import np.org.ravnepal.model.User;
import np.org.ravnepal.response.UserResponse;
import np.org.ravnepal.service.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public UserResponse doLogin(User user) {

		User user1 = new User();
		UserResponse resp = new UserResponse();
		String sql = "Select * from users where email = ? and password = ?";

		try {
			user1 = (User) jdbcTemplate.queryForObject(sql,
					new Object[] { user.getEmail(), user.getPassword() },
					new UserRowMapper());
		} catch (EmptyResultDataAccessException e) {
			user1 = null;
		}

		if (user1 != null) {
			String loginSql = "SELECT ac.chart_id from active_charts ac join charts c  on ac.chart_id = c.id where ac.user_id = ? and c.status <> 1";

			long chartId;
			try {
				chartId = (long) getJdbcTemplate().queryForObject(loginSql,
						new Object[] { user1.getId() }, Long.class);
			} catch (EmptyResultDataAccessException e) {
				chartId = -1;
			}

			if (chartId < 0) {

				// new
				String getSql = "SELECT * FROM charts c WHERE c.id not in (select chart_id from user_charts uc) and c.id not in (select chart_id from active_charts) order by name limit 1";

				Chart chart = jdbcTemplate.queryForObject(getSql,
						new ChartRowMapper());

				String updateSql = "INSERT INTO active_charts (user_id, chart_id) VALUES(? , ?) ON CONFLICT (user_id) DO UPDATE SET chart_id=?";
				jdbcTemplate.update(updateSql, new Object[] { user1.getId(),
						chart.getId(), chart.getId() });
				// Insert sql

				String insertSql = "Insert into user_charts (chart_id, user_id) values (?,?)";
				jdbcTemplate.update(insertSql, new Object[] { chart.getId(),
						user1.getId() });

			}
			resp.setFlag(true);
			resp.setId(user1.getId());
			resp.setUsername(user1.getUsername());
		}
		return resp;
	}
}