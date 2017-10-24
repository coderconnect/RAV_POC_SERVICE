package np.org.ravnepal;

import java.util.List;

import np.org.ravnepal.model.Claim;
import np.org.ravnepal.model.CptClaim;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.CptClaimDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/cptclaim")
public class CptClaimController {
	@Autowired
	private CptClaimDao cptClaimDao;

	@RequestMapping(value = "/get/", method = RequestMethod.POST)
	public ResponseEntity<List<CptClaim>> userLogin(@RequestBody Claim claim) {
		List<CptClaim> claimList = cptClaimDao.getCptClaimsbyId(claim
				.getClaimId());
		return new ResponseEntity<List<CptClaim>>(claimList, HttpStatus.OK);
	}

	@RequestMapping(value = "/addCptClaim/", method = RequestMethod.POST)
	public ResponseEntity<Status> addCptClaim(
			@RequestBody CptClaim cptClaim) {
		Status status = cptClaimDao.addCptClaim(cptClaim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/addComment/", method = RequestMethod.POST)
	public ResponseEntity<Status> addCptComment(@RequestBody CptClaim cptClaim) {
		Status status = cptClaimDao.addComment(cptClaim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}
}
