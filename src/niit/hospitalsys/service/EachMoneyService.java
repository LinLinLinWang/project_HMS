package niit.hospitalsys.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.imp.EachMoneyDaoImp;
import niit.hospitalsys.entity.Eachmoney;

@Service
public class EachMoneyService {
	@Resource
	EachMoneyDaoImp eachMoneyDaoImp;

	public List<Eachmoney> findAll() {
		List<Eachmoney> list = new ArrayList<>();
		list = eachMoneyDaoImp.findAll();

		return list;
	}

	public Eachmoney findByMId(int mid) {

		return eachMoneyDaoImp.findByMId(mid);
	}

	public boolean update(Eachmoney eachmoney) {
		return eachMoneyDaoImp.update(eachmoney);

	}
	public  List<Eachmoney>  findBytype(int type) {
		// TODO Auto-generated method stub
		List<Eachmoney>  list=new ArrayList<>();
		
		list=eachMoneyDaoImp.findBytype(type);
		return list;
	}
	public boolean save(Eachmoney eachmoney) {
		// TODO Auto-generated method stub
		eachMoneyDaoImp.save(eachmoney);
		return false;
	
}}
