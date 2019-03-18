package niit.hospitalsys.dao;

import java.util.List;

import niit.hospitalsys.entity.Entitler;

public interface EntitlerDao {
	//查询所有的职称
	List<Entitler> findAllEntitler();
	Entitler findById(int DEntitle);
}
