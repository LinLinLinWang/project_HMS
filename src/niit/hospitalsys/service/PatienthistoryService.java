package niit.hospitalsys.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.PatienthistoryDao;
import niit.hospitalsys.dao.imp.PatienthistoryDaoImp;
import niit.hospitalsys.entity.Patienthistory;

@Service
public class PatienthistoryService {
	@Resource
	PatienthistoryDaoImp patienthistoryDaoImp;

	public void save(Patienthistory patienthistory) {
		System.out.println("尝试保存");
		patienthistoryDaoImp.save(patienthistory);
		System.out.println("保存成功");
	};

	public List findAll(String dregiste, Date nowtime) {
		List list=new ArrayList<>();
		list=patienthistoryDaoImp.findAll(dregiste, nowtime);
        
		return list;
		
		
	}
	public boolean updatePation(Patienthistory patienthistory) {
		return patienthistoryDaoImp.updatePation(patienthistory);
	}
	public Patienthistory findByHid(String hid) {
		
		return  patienthistoryDaoImp.findByHid(hid);
	}
	public List<Patienthistory> findByTypeAndResgite(int type, String registe){
		return patienthistoryDaoImp.findByTypeAndResgite(type, registe);
		
	}
	public List<Patienthistory> findByResgite(String registe) {
		System.out.println(registe);
		   List<Patienthistory> list = new ArrayList<>();
		   
		
		   list= patienthistoryDaoImp.findByResgite(registe);
			  
		  
		 return list;
	}
	public List<Patienthistory> findByType(int type) {
	
		return patienthistoryDaoImp.findByType(type);
	}
	public List<Patienthistory> findByHompitaltime() {
		// TODO Auto-generated method stub
		 
		  
		return patienthistoryDaoImp.findByHompitaltime();
	}
	
}
