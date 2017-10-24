package np.org.ravnepal.service;

import java.util.List;

import np.org.ravnepal.model.Claim;
import np.org.ravnepal.response.ClaimStatus;
import np.org.ravnepal.response.Status;

public interface ClaimDao {

	public List<Claim> getClaimsByUserId(long userId); 
	
	public Status updateClaimComment(Claim claim);
	
	public Status changeReviewState(Claim claim);
	
	public Status addClaim(Claim claim);
	
	public ClaimStatus getClaimStatus(Claim claim);
	
	public Status setClaimStatus(Claim claim);
	
	public Status updateDOS(Claim claim);
}
