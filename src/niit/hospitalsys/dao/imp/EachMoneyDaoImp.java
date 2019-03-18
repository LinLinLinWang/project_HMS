package niit.hospitalsys.dao.imp;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.EachMoneyDao;
import niit.hospitalsys.entity.Eachmoney;

@Repository
public class EachMoneyDaoImp implements EachMoneyDao {
	@Resource
	SessionFactory sessionFactory;

	@Override
	public List<Eachmoney> findAll() {
		List<Eachmoney> list = new ArrayList<>();

		String sql = "select * from eachmoney";
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		query.addEntity(Eachmoney.class);

		list = query.list();
		System.out.println("=========================================22222222");
		return list;
	}

	@Override
	public Eachmoney findByMId(int mid) {
		// TODO Auto-generated method stub
		List<Eachmoney> list = new ArrayList<>();

		String sql = "select * from eachmoney where MId =" + mid;
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		query.addEntity(Eachmoney.class);
		list=query.list();
		if(list.size()==0){
			return null;
		}else{
			Eachmoney eachmoney = (Eachmoney) (query.list().get(0));

			return eachmoney;
		}
		
	}

	@Override
	public boolean update(Eachmoney eachmoney) {
		// TODO Auto-generated method stub
		try {
			sessionFactory.getCurrentSession().update(eachmoney);

			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}

	}

	@Override
	public  List<Eachmoney>  findBytype(int type) {
		// TODO Auto-generated method stub
		List<Eachmoney>  list=new ArrayList<>();
		String sql = "select * from eachmoney where Mtype =" + type;
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		query.addEntity(Eachmoney.class);

		list = query.list();
		
		return list;
	}

	@Override
	public boolean save(Eachmoney eachmoney) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(eachmoney);

		return false;
	}

}
