package niit.hospitalsys.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.imp.BloodDaoImp;
import niit.hospitalsys.dao.imp.DoctorDaoImp;
import niit.hospitalsys.entity.Bloodhistory;
import niit.hospitalsys.entity.Blooduser;

@Service
public class BloodService {

	@Resource
	BloodDaoImp bloodDaoImp;
	public void update(Blooduser blooduser) {
		// TODO Auto-generated method stub
		bloodDaoImp.update(blooduser);
		
	}
	public void save(Blooduser blooduser) {
		// TODO Auto-generated method stub
		bloodDaoImp.save(blooduser);
		
	}

	
	public void savehis(Bloodhistory bloodhistory) {
		// TODO Auto-generated method stub
		bloodDaoImp.savehis(bloodhistory);

	}
	public List<Bloodhistory> findAll() {
		// TODO Auto-generated method stub
		
		return bloodDaoImp.findAll();

}
	public Blooduser findbyRegisteID(String id) {
	
       
		return bloodDaoImp.findbyRegisteID(id);

	}
	

}
