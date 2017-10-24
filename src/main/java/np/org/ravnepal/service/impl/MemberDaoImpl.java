package np.org.ravnepal.service.impl;

import np.org.ravnepal.mapper.MemberRowMapper;
import np.org.ravnepal.model.Member;
import np.org.ravnepal.service.MemberDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
	@Override
	public Member getMemberInfoByChartId(long userId) {
		
		Member member = new Member();
		String sql = ""
				+ "SELECT m.id            AS mid, "
				+ "       m.full_name     AS mFullName, "
				+ "       m.address, "
				+ "       m.memid, "
				+ "       to_char(m.date_of_birth,'MM/DD/YYYY') AS dob, "
				+ "       p.id            AS pid, "
				+ "       p.full_name     AS pFullName, "
				+ "       p.npi "
				+ "FROM   members m, "
				+ "       providers p, "
				+ "       charts c, "
				+ "       active_charts ac "
				+ "WHERE  c.member_id = m.id "
				+ "       AND m.provider_id = p.id "
				+ "		  AND c.id = ac.chart_id"	  
				+ "		  AND ac.user_id = ?";
		
		try{
			member = (Member) jdbcTemplate.queryForObject(sql, new Object[] {
					userId }, new MemberRowMapper());
			return member;
		}catch(EmptyResultDataAccessException e){
			return null;
		}
		
	}

}
