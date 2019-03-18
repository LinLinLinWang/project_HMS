package niit.hospitalsys.dao;

import java.util.List;

import niit.hospitalsys.entity.Doctor;

/**
 * 医生的dao 定义医生接口
 */
public interface DoctorDao {
	// 医生的职称以及医生的科室等信息插入docotor表中
	void save(Doctor doctor);
	void delete (Doctor doctor);
	// 根据id查询是否为医生
	Doctor findById(String uregisteid);

	// 查询所有的医生
	List<Doctor> findAll();

	// 查询指定科室所有的医生
	List<Doctor> findByOfficeId(int OfficeId);

}
