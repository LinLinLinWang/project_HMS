package niit.hospitalsys.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.imp.OfficeDaoImp;
import niit.hospitalsys.entity.Office;

@Service
public class OfficeService {
	@Resource
	OfficeDaoImp officeDaoImp;

	public List<Office> findAllOffice() {

		return officeDaoImp.findAllOffice();

	}

	// 根据id查找科室
	public Office findById(int officeId) {
		Office office = new Office();
		office = officeDaoImp.findById(officeId);
		return office;
	}
}
