package np.org.ravnepal.service;

import np.org.ravnepal.model.Member;

public interface MemberDao {

	public Member getMemberInfoByChartId(long userId);
}
