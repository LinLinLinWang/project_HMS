package niit.hospitalsys.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.imp.DoctorDaoImp;
import niit.hospitalsys.entity.Doctor;

@Service
public class DoctorService {
	@Resource
	DoctorDaoImp doctorDaoImp;

	public void save(Doctor doctor) {

		doctorDaoImp.save(doctor);

	}

	public Doctor findById(String uregisteid) {

		Doctor docotr = doctorDaoImp.findById(uregisteid);
		System.out.println("医生" + docotr);
		return docotr;
	}

	public List<Doctor> findAll() {
		List<Doctor> list = new ArrayList<Doctor>();
		System.out.println("这里空指针");
		list = doctorDaoImp.findAll();
		return list;
	}
    //获取指定科室医生信息
	public List<Doctor> findByOfficeId(int OfficeId) {
		List<Doctor> list = new ArrayList<Doctor>();
		list = doctorDaoImp.findByOfficeId(OfficeId);
		return list;
	}
	public void delete(Doctor doctor) {
		// TODO Auto-generated method stub
		doctorDaoImp.delete(doctor);

		
	}

}
