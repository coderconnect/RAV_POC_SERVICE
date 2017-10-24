package np.org.ravnepal;

import java.util.List;

import np.org.ravnepal.model.Claim;
import np.org.ravnepal.model.DxClaim;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.DxClaimDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/dxclaim")
public class DxClaimController {
	@Autowired
	private DxClaimDao dxClaimDao;

	@RequestMapping(value = "/get/", method = RequestMethod.POST)
	public ResponseEntity<List<DxClaim>> userLogin(@RequestBody Claim claim) {
		List<DxClaim> claimList = dxClaimDao
				.getDxClaimsbyId(claim.getClaimId());
		return new ResponseEntity<List<DxClaim>>(claimList, HttpStatus.OK);
	}

	@RequestMapping(value = "/setInvalidState/", method = RequestMethod.POST)
	public ResponseEntity<Status> setReviewState(@RequestBody DxClaim dxClaim) {
		Status status = dxClaimDao.changeInvalidState(dxClaim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/addComment/", method = RequestMethod.POST)
	public ResponseEntity<Status> addComment(@RequestBody DxClaim dxClaim) {
		Status status = dxClaimDao.addComment(dxClaim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/addDxClaim/", method = RequestMethod.POST)
	public ResponseEntity<Status> addDxClaim(@RequestBody DxClaim dxClaim) {
		Status status = dxClaimDao.addDxClaim(dxClaim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/setReason/", method = RequestMethod.POST)
	public ResponseEntity<Status> setReason(@RequestBody DxClaim dxClaim) {
		Status status = dxClaimDao.setReason(dxClaim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}
	
}
