package np.org.ravnepal.service;

import java.util.List;

import np.org.ravnepal.model.DxClaim;
import np.org.ravnepal.response.Status;

public interface DxClaimDao {

	List<DxClaim> getDxClaimsbyId(String string);
	
	public Status changeInvalidState(DxClaim claim);
	
	public Status addComment(DxClaim dxClaim);
	
	public Status addDxClaim(DxClaim dxClaim);
	
	public Status setReason(DxClaim dxClaim);

}
