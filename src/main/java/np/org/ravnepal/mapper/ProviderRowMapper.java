package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.Provider;

import org.springframework.jdbc.core.RowMapper;

public class ProviderRowMapper implements RowMapper<Provider> {

	public Provider mapRow(ResultSet rs, int rowNum) throws SQLException {
		Provider provider = new Provider();
		provider.setId(rs.getLong("id"));

		provider.setFullName(rs.getString("full_name"));
		provider.setNpi(rs.getString("npi"));
		return provider;
	}

}
