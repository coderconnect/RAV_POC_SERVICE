package np.org.ravnepal;

import np.org.ravnepal.model.Member;
import np.org.ravnepal.model.User;
import np.org.ravnepal.service.MemberDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = "/info/", method = RequestMethod.POST)
	public ResponseEntity<Member> getMemberInfo(@RequestBody User user) {
		Member member = memberDao.getMemberInfoByChartId(user.getId());
		return new ResponseEntity<Member>(member, HttpStatus.OK);
	}
}
