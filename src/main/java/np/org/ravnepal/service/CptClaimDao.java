package np.org.ravnepal.service;

import java.util.List;

import np.org.ravnepal.model.CptClaim;
import np.org.ravnepal.response.Status;

public interface CptClaimDao {

	List<CptClaim> getCptClaimsbyId(String string);
	
	Status addCptClaim(CptClaim cptClaim);
	
	Status addComment(CptClaim cptClaim);

}
