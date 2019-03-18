package niit.hospitalsys.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.OfficeDao;
import niit.hospitalsys.entity.Office;
@Repository
public class OfficeDaoImp implements OfficeDao {


	@Resource
	SessionFactory sessionFactory;
	

	@Override
	public List<Office> findAllOffice() {
		
		String hql = "from Office";  
		System.out.println("查询语句是：");
        Query query  = sessionFactory.getCurrentSession().createQuery(hql);  
        System.out.println(query.list());
        return query.list(); 
	    
	}


	@Override
	public Office findById(int officeId) {

        String sql = "select * from office where DOfficeld="+officeId;
  
        SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        query.addEntity(Office.class);

        List<Office> list = query.list();
        Office office=list.get(0);
		return office;
	}

}
