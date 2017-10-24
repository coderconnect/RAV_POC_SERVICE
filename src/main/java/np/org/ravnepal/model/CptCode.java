package np.org.ravnepal.model;

public class CptCode {

	long id;
	String cptCode;
	String cptDesc;
	String cptCombined;

	public String getCptCombined() {
		return cptCombined;
	}

	public void setCptCombined() {
		this.cptCombined = this.cptCode + " - " + this.cptDesc;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCptCode() {
		return cptCode;
	}

	public void setCptCode(String cptCode) {
		this.cptCode = cptCode;
	}

	public String getCptDesc() {
		return cptDesc;
	}

	public void setCptDesc(String cptDesc) {
		this.cptDesc = cptDesc;
	}

}
