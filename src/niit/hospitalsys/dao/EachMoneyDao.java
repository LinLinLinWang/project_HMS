package niit.hospitalsys.dao;

import java.util.List;

import niit.hospitalsys.entity.Eachmoney;

public interface EachMoneyDao {
	//查询所有信息
 List<Eachmoney>   findAll();
 Eachmoney   findByMId(int mid);
 boolean update(Eachmoney eachmoney);
 boolean save(Eachmoney eachmoney);
 List<Eachmoney>  findBytype(int type);
}
