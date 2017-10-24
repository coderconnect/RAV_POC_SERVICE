package np.org.ravnepal.service;

import java.util.List;

import np.org.ravnepal.model.Chart;
import np.org.ravnepal.model.Reason;
import np.org.ravnepal.response.Status;

public interface ChartDao {
	
	public Chart getChartById(long userId);
	
	public boolean moveToNextChart(long userId);
	
	public List<Reason> getCannotReviewList();
	
	public List<Reason> getReasonsList();
	
	public Status updateChartComment(Chart chart);
	
	public Status updateCannotReview(Chart chart);
	
	public Status completeChart(Chart chart);
	
	public Status saveForLater(Chart chart);
}
