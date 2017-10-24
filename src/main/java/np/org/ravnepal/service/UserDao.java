package np.org.ravnepal.service;

import np.org.ravnepal.model.User;
import np.org.ravnepal.response.UserResponse;

public interface UserDao {

	// User Login
	public UserResponse doLogin(User user);

}
