package np.org.ravnepal.model;


public class Claim {

	long id;
	long chartId;
	String claimId;
	String comment;
	int status;
	String dateOfservice;
	String codingDate;
	Provider provider;
	String insertType;

	public Provider getProvider() {
		return provider;
	}

	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	boolean reviewed;

	public boolean isReviewed() {
		return reviewed;
	}

	public void setReviewed(boolean reviewed) {
		this.reviewed = reviewed;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getChartId() {
		return chartId;
	}

	public void setChartId(long chartId) {
		this.chartId = chartId;
	}

	public String getClaimId() {
		return claimId;
	}

	public void setClaimId(String claimId) {
		this.claimId = claimId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int i) {
		this.status = i;
	}

	public String getDateOfService() {
		return dateOfservice;
	}

	public void setDateOfService(String dateOfservice) {
		this.dateOfservice = dateOfservice;
	}

	public String getInsertType() {
		return insertType;
	}

	public void setInsertType(String insertType) {
		this.insertType = insertType;
	}

	public String getCodingDate() {
		return codingDate;
	}

	public void setCodingDate(String codingDate) {
		this.codingDate = codingDate;
	}
}
