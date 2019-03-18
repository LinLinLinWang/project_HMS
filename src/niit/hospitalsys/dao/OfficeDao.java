package niit.hospitalsys.dao;

import java.util.List;

import niit.hospitalsys.entity.Office;

public interface OfficeDao {
   //遍历集合
	List<Office> findAllOffice();
	//查找制定id的科室
	Office findById(int officeId);
}
