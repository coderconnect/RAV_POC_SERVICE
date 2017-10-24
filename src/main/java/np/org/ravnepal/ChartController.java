package np.org.ravnepal;

import java.util.List;

import np.org.ravnepal.model.Chart;
import np.org.ravnepal.model.Reason;
import np.org.ravnepal.model.User;
import np.org.ravnepal.response.Status;
import np.org.ravnepal.service.ChartDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chart")
public class ChartController {

	@Autowired
	private ChartDao chartDao;

	@RequestMapping(value = "/user/", method = RequestMethod.POST)
	public ResponseEntity<Chart> getChart(@RequestBody User user) {
		Chart chart = chartDao.getChartById(user.getId());
		return new ResponseEntity<Chart>(chart, HttpStatus.OK);
	}

	@RequestMapping(value = "/next/", method = RequestMethod.POST)
	public ResponseEntity<Status> nextChart(@RequestBody User user) {
		boolean flag = chartDao.moveToNextChart(user.getId());

		return new ResponseEntity<Status>(new Status(flag), HttpStatus.OK);
	}

	@RequestMapping(value = "/registercodingcomplete/", method = RequestMethod.POST)
	public ResponseEntity<Status> completeChart(@RequestBody Chart chart) {
		Status status = chartDao.completeChart(chart);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/saveforlater/", method = RequestMethod.POST)
	public ResponseEntity<Status> saveChartForLater(@RequestBody Chart chart) {
		//Status status = chartDao.saveForLater(chart);
		return new ResponseEntity<Status>(new Status(true), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/cannotReview/")
	public ResponseEntity<List<Reason>> cannotReviewList() {
		List<Reason> reasonList = chartDao.getCannotReviewList();
		return new ResponseEntity<List<Reason>>(reasonList, HttpStatus.OK);
	}

	@RequestMapping(value = "/reasons/")
	public ResponseEntity<List<Reason>> reasonList() {
		List<Reason> reasonList = chartDao.getReasonsList();
		return new ResponseEntity<List<Reason>>(reasonList, HttpStatus.OK);
	}

	@RequestMapping(value = "/postComment")
	public ResponseEntity<Status> postComment(@RequestBody Chart chart) {
		Status status = chartDao.updateChartComment(chart);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

	@RequestMapping(value = "/registerCannotReview")
	public ResponseEntity<Status> registerCannotComment(@RequestBody Chart chart) {
		Status status = chartDao.updateCannotReview(chart);
		return new ResponseEntity<Status>(status, HttpStatus.OK);
	}

}
