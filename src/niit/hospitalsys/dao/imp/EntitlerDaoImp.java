package niit.hospitalsys.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.EntitlerDao;
import niit.hospitalsys.entity.Entitler;
@Repository
public class EntitlerDaoImp implements EntitlerDao {
	@Resource
	SessionFactory sessionFactory;
	
	@Override
	public List<Entitler> findAllEntitler() {
		String hql = "from Entitler";  
		System.out.println("查询语句是：");
        Query query  = sessionFactory.getCurrentSession().createQuery(hql);  
        System.out.println(query.list());
        return query.list(); 
		
	}
   //根据id查询职称名称
	@Override
	public Entitler findById(int DEntitle) {
		// TODO Auto-generated method stub

        String sql = "select * from entitler where DEntitle="+DEntitle;
  
        SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        query.addEntity(Entitler.class);

        List<Entitler> list = query.list();
        Entitler entitler=list.get(0);
		return entitler;
	}

}
