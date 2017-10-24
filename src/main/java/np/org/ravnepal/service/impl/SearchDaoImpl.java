package np.org.ravnepal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import np.org.ravnepal.mapper.CptCodeRowMapper;
import np.org.ravnepal.mapper.DxCodeRowMapper;
import np.org.ravnepal.mapper.ProviderRowMapper;
import np.org.ravnepal.model.CptCode;
import np.org.ravnepal.model.DxCode;
import np.org.ravnepal.model.Provider;
import np.org.ravnepal.service.SearchDao;

@Repository
public class SearchDaoImpl implements SearchDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public List<Provider> searchProvider(String query) {
		List<Provider> providerList = new ArrayList<Provider>();

		String sql = "SELECT * from providers where full_name ilike ?";

		try {
			providerList = jdbcTemplate.query(sql, new Object[] { "%" + query
					+ "%" }, new ProviderRowMapper());
			return providerList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

	@Override
	public List<DxCode> searchDxByCode(String query) {

		List<DxCode> dxCodeList = new ArrayList<DxCode>();
		String sql = "SELECT * from dx_codes where dxcode ilike ? or description ilike ?";

		try {
			dxCodeList = jdbcTemplate.query(sql, new Object[] {
					"%" + query + "%", "%" + query + "%" },
					new DxCodeRowMapper());
			return dxCodeList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public List<CptCode> searchCptByCode(String query) {
		List<CptCode> cptCodeList = new ArrayList<CptCode>();
		String sql = "SELECT * from cpt_codes where cptcode ilike ? or description ilike ?";

		try {
			cptCodeList = jdbcTemplate.query(sql, new Object[] {
					"%" + query + "%", "%" + query + "%" },
					new CptCodeRowMapper());
			return cptCodeList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

	@Override
	public List<DxCode> searchDxByDesc(String query) {
		List<DxCode> dxDescList = new ArrayList<DxCode>();
		String sql = "SELECT * from dx_codes where description ilike ?";

		try {
			dxDescList = jdbcTemplate.query(sql, new Object[] { "%" + query
					+ "%" }, new DxCodeRowMapper());
			return dxDescList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public List<CptCode> searchCptByDesc(String query) {
		List<CptCode> cptDescList = new ArrayList<CptCode>();
		String sql = "SELECT * from cpt_codes where description ilike ?";

		try {
			cptDescList = jdbcTemplate.query(sql, new Object[] { "%" + query
					+ "%" }, new CptCodeRowMapper());
			return cptDescList;
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

}
