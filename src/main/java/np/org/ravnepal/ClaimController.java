package np.org.ravnepal;

import java.util.List;

import np.org.ravnepal.model.Claim;
import np.org.ravnepal.model.User;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.ClaimDao;
import np.org.ravnepal.service.HelperService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/claim")
public class ClaimController {

	@Autowired
	private ClaimDao claimDao;

	@Autowired
	private HelperService helper;

	@RequestMapping(value = "/get/", method = RequestMethod.POST)
	public ResponseEntity<List<Claim>> userLogin(@RequestBody User user) {
		List<Claim> claimList = claimDao.getClaimsByUserId(user.getId());
		return new ResponseEntity<List<Claim>>(claimList, HttpStatus.OK);
	}

	@RequestMapping(value = "/updateComment/", method = RequestMethod.POST)
	public ResponseEntity<Status> updateComment(@RequestBody Claim claim) {
		Status status = claimDao.updateClaimComment(claim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/setReviewState/", method = RequestMethod.POST)
	public ResponseEntity<Status> setReviewState(@RequestBody Claim claim) {
		Status status = claimDao.changeReviewState(claim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/addClaim/", method = RequestMethod.POST)
	public ResponseEntity<Status> addClaim(@RequestBody Claim claim) {
		// Get unique claim ID
		claim.setClaimId(helper.getNextClaimId());
		claim.setCodingDate(helper.getCurrentDate());
		Status status = claimDao.addClaim(claim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/updateDos", method = RequestMethod.POST)
	public ResponseEntity<Status> updateDos(@RequestBody Claim claim) {

		Status status = claimDao.updateDOS(claim);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

}
