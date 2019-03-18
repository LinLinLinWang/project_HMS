package niit.hospitalsys.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.imp.EntitlerDaoImp;
import niit.hospitalsys.entity.Entitler;

@Service
public class EntitlerService {
	 @Resource
     EntitlerDaoImp entitlerDaoImp;
     
      public List<Entitler> findAllEntitler(){
    	 
    	return entitlerDaoImp.findAllEntitler();
    	 
     }
   // 根据id查找职称
  	public Entitler findById(int officeId) {
  		Entitler entitler = new Entitler();
  		entitler = entitlerDaoImp.findById(officeId);
  		return entitler;
  	}
      
    
}
