package np.org.ravnepal.response;

public class Status {

	boolean flag;
	String message;

	public Status(boolean flag) {
		this.flag = flag;

	}

	public Status() {

	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
