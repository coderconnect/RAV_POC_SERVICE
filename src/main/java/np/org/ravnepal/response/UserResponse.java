package np.org.ravnepal.response;

public class UserResponse {

	long id;
	boolean flag;
	String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public UserResponse(long id, boolean flag, String username) {
		this.id = id;
		this.flag = flag;
		this.username = username;
	}

	public UserResponse() {
		this.flag = false;
		this.id = 0;
		this.username = "";
	}

}
