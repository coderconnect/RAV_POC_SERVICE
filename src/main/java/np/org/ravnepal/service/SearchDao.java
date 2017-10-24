package np.org.ravnepal.service;

import java.util.List;

import np.org.ravnepal.model.CptCode;
import np.org.ravnepal.model.DxCode;
import np.org.ravnepal.model.Provider;

public interface SearchDao {
	
	public List<Provider> searchProvider(String query);
	
	public List<DxCode> searchDxByCode(String query);
	
	public List<CptCode> searchCptByCode(String query);
	
	public List<DxCode> searchDxByDesc(String query);
	
	public List<CptCode> searchCptByDesc(String query);
	
}
