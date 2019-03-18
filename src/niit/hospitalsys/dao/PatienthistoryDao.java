package niit.hospitalsys.dao;

import java.util.Date;
import java.util.List;

import niit.hospitalsys.entity.Patienthistory;

public interface PatienthistoryDao {
         //save
	void save(Patienthistory patienthistory);
	List findAll(String dregiste,Date nowtime);
	Patienthistory findByHid(String hid);
	boolean updatePation(Patienthistory patienthistory);
	List<Patienthistory> findByTypeAndResgite(int type,String registe);
	List<Patienthistory> findByResgite(String registe);
	List<Patienthistory> findByType(int type);
	List<Patienthistory> findByHompitaltime();
}
