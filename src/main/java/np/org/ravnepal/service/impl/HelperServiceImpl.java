package np.org.ravnepal.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import np.com.ravnepal.helper.RandomString;
import np.org.ravnepal.service.HelperService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HelperServiceImpl implements HelperService {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Override
	public String getCurrentDate() {
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date currentDate = new Date();
		String dateString = dateFormat.format(currentDate);
		return dateString;
	}

	@Override
	public String getNextClaimId() {
		String initialClaimId;
		String checkSql;

		initialClaimId = new RandomString(16).nextString();

		int count = 1;
		do {
			initialClaimId = new RandomString(16).nextString();
			checkSql = "Select count(claim_id) from chart_claims where claim_id = ?";
			count = jdbcTemplate.queryForObject(checkSql,
					new Object[] { initialClaimId }, Integer.class);
		} while (count != 0);

		return initialClaimId;
	}

	@Override
	public boolean isFutureDate(String date) {
		Date currentDate = new Date();

		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		Date dosDate;

		try {
			dosDate = df.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dosDate = null;
		}
		if (dosDate.compareTo(currentDate) > 0) {
			return true;
		}
		return false;
	}
}
