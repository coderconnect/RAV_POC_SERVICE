package np.org.ravnepal.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import np.org.ravnepal.model.Member;
import np.org.ravnepal.model.Provider;

import org.springframework.jdbc.core.RowMapper;

public class MemberRowMapper implements RowMapper<Member> {

	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
		Member member = new Member();
		member.setId(rs.getLong("mid"));
		member.setFullName(rs.getString("mFullName"));
		member.setAddress(rs.getString("address"));
		member.setDateOfBirth(rs.getString("dob"));
		member.setMemid(rs.getString("memid"));

		Provider provider = new Provider();
		provider.setId(rs.getLong("pid"));
		provider.setFullName(rs.getString("pFullName"));
		provider.setNpi(rs.getString("npi"));

		member.setProvider(provider);

		return member;
	}
}
