package np.org.ravnepal.model;

public class CptClaim {

	long id;
	String claimId;
	CptCode cptCode;
	String comment;
	String modifier;
	String insertType;
	
	public String getInsertType() {
		return insertType;
	}
	public void setInsertType(String insertType) {
		this.insertType = insertType;
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
	public CptCode getCptCode() {
		return cptCode;
	}
	public void setCptCode(CptCode cptCode) {
		this.cptCode = cptCode;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getModifiers() {
		return modifier;
	}
	public void setModifiers(String modifier) {
		this.modifier = modifier;
	}	
	
}

