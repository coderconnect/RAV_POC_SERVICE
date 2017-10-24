package np.org.ravnepal.model;

public class DxClaim {

	long id;
	String claimId;
	DxCode dxCode;
	String comment;
	Provider provider;
	long reasonId;
	int status;
	boolean invalid;
	String insertType;
	
	public String getInsertType() {
		return insertType;
	}
	public void setInsertType(String insertType) {
		this.insertType = insertType;
	}
	public boolean isInvalid() {
		return invalid;
	}
	public void setInvalid(boolean invalid) {
		this.invalid = invalid;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getClaimId() {
		return claimId;
	}
	public void setClaimId(String claimId) {
		this.claimId = claimId;
	}
	public DxCode getDxCode() {
		return dxCode;
	}
	public void setDxCode(DxCode dxCode) {
		this.dxCode = dxCode;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Provider getProvider() {
		return provider;
	}
	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	public long getReasonId() {
		return reasonId;
	}
	public void setReasonId(long reasonId) {
		this.reasonId = reasonId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
