package np.org.ravnepal.model;

public class DxCode {

	long id;
	String dxCode;
	String dxDesc;
	String hcc;
	String dxCombined;

	public String getDxCombined() {
		return dxCombined;
	}

	public void setDxCombined() {
		this.dxCombined = this.dxCode + " - " + this.dxDesc;
	}

	public String getHcc() {
		return hcc;
	}

	public void setHcc(String hcc) {
		this.hcc = hcc;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDxCode() {
		return dxCode;
	}

	public void setDxCode(String dxCode) {
		this.dxCode = dxCode;
	}

	public String getDxDesc() {
		return dxDesc;
	}

	public void setDxDesc(String dxDesc) {
		this.dxDesc = dxDesc;
	}

}
