package np.org.ravnepal;

import np.org.ravnepal.model.User;
import np.org.ravnepal.response.UserResponse;
import np.org.ravnepal.service.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDao userDao;

	@RequestMapping(value = "/login/", method = RequestMethod.POST)
	public ResponseEntity<UserResponse> userLogin(@RequestBody User user) {
		UserResponse resp = userDao.doLogin(user);
		return new ResponseEntity<UserResponse>(resp, HttpStatus.OK);
	}

}
