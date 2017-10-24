package np.org.ravnepal.service;

import java.util.List;

import np.org.ravnepal.model.Provider;

public interface ProviderDao {
	
	public List<Provider> searchProvider(String query);

}
