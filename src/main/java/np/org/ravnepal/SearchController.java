package np.org.ravnepal;

import java.util.List;

import np.org.ravnepal.model.CptCode;
import np.org.ravnepal.model.DxCode;
import np.org.ravnepal.model.Provider;
import np.org.ravnepal.model.Search;
import np.org.ravnepal.response.CptCodes;
import np.org.ravnepal.response.DxCodes;
import np.org.ravnepal.response.Providers;
import np.org.ravnepal.service.SearchDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private SearchDao searhDao;

	@RequestMapping(value = "/provider/", method = RequestMethod.POST)
	public ResponseEntity<Providers> searchProvider(
			@RequestBody Search search) {
		List<Provider> provList = searhDao.searchProvider(search.getQuery());
		Providers providers = new Providers();
		providers.setProviderList(provList);
		return new ResponseEntity<Providers>(providers, HttpStatus.OK);
	}

	@RequestMapping(value = "/dxcode/", method = RequestMethod.POST)
	public ResponseEntity<DxCodes> searchDxCode(@RequestBody Search search) {
		List<DxCode> dxCodeList = searhDao.searchDxByCode(search.getQuery());
		DxCodes dxcodes = new DxCodes();
		dxcodes.setDxCodeList(dxCodeList);
		return new ResponseEntity<DxCodes>(dxcodes, HttpStatus.OK);
	}

	@RequestMapping(value = "/dxdesc/", method = RequestMethod.POST)
	public ResponseEntity<DxCodes> searchDxDesc(@RequestBody Search search) {
		List<DxCode> dxCodeList = searhDao.searchDxByDesc(search.getQuery());
		DxCodes dxcodes = new DxCodes();
		dxcodes.setDxCodeList(dxCodeList);
		return new ResponseEntity<DxCodes>(dxcodes, HttpStatus.OK);
	}

	@RequestMapping(value = "/cptcode/", method = RequestMethod.POST)
	public ResponseEntity<CptCodes> searchCptCode(@RequestBody Search search) {
		List<CptCode> cptCodeList = searhDao.searchCptByCode(search.getQuery());
		CptCodes cptcodes = new CptCodes();
		cptcodes.setCptCodeList(cptCodeList);
		return new ResponseEntity<CptCodes>(cptcodes, HttpStatus.OK);
	}

	@RequestMapping(value = "/cptdesc/", method = RequestMethod.POST)
	public ResponseEntity<CptCodes> searchCptDesc(@RequestBody Search search) {
		List<CptCode> cptCodeList = searhDao.searchCptByDesc(search.getQuery());
		CptCodes cptcodes = new CptCodes();
		cptcodes.setCptCodeList(cptCodeList);
		return new ResponseEntity<CptCodes>(cptcodes, HttpStatus.OK);
	}
}
