package niit.hospitalsys.dao.imp;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.CheckFactResaultDao;
import niit.hospitalsys.entity.Checkfactresult;
@Repository
public class CheckFactResaultDaoImp implements CheckFactResaultDao {
	@Resource
	SessionFactory sessionFactory;
	@Override
	public List<Checkfactresult> findByHid(int hid) {
		List<Checkfactresult> list = new ArrayList<>();

		String sql = "select * from checkfactresult where PHId =" + hid;
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		query.addEntity(Checkfactresult.class);
		list = query.list();

		return list;
	}
	@Override
	public void save(Checkfactresult checkfactresult) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(checkfactresult);
		
	}

}
