package np.org.ravnepal.service.impl;

import java.util.ArrayList;
import java.util.List;

import np.org.ravnepal.mapper.ProviderRowMapper;
import np.org.ravnepal.model.Provider;
import np.org.ravnepal.service.ProviderDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProviderDaoImpl implements ProviderDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public List<Provider> searchProvider(String query) {

		List<Provider> providerList = new ArrayList<Provider>();

		String sql = "SELECT * from providers where full_name like ?";

		try {
			providerList = jdbcTemplate.query(sql, new Object[] { "%" + query + "%" },
					new ProviderRowMapper());
			return providerList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

}
