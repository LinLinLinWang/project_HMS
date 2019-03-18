package niit.hospitalsys.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.imp.CheckFactResaultDaoImp;
import niit.hospitalsys.entity.Checkfactresult;

@Service
public class CheckFactResultService {
	@Resource
	CheckFactResaultDaoImp checkFactResaultDaoImp;

	public List<Checkfactresult> findByHid(int hid) {

		return checkFactResaultDaoImp.findByHid(hid);
	}

	public void save(Checkfactresult checkfactresult) {
		// TODO Auto-generated method stub
		checkFactResaultDaoImp.save(checkfactresult);

	}
}
