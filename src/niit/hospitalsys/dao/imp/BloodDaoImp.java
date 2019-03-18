package niit.hospitalsys.dao.imp;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.BloodDao;
import niit.hospitalsys.entity.Answerquestion;
import niit.hospitalsys.entity.Bloodhistory;
import niit.hospitalsys.entity.Blooduser;

@Repository
public class BloodDaoImp implements BloodDao {
	@Resource
	SessionFactory sessionFactory;

	@Override
	public void update(Blooduser blooduser) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().clear();
		sessionFactory.getCurrentSession().update(blooduser);
	}

	@Override
	public void savehis(Bloodhistory bloodhistory) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(bloodhistory);

	}

	@Override
	public List<Bloodhistory> findAll() {
		// TODO Auto-generated method stub
				List<Bloodhistory> list = new ArrayList<>();

				String sql = "select * from bloodhistory";
				System.out.println(sql);
				SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

				query.addEntity(Bloodhistory.class);

				list = query.list();
			
				System.out.println("=========================================22222222");

				return list;

	}

	@Override
	public Blooduser findbyRegisteID(String id) {
		// TODO Auto-generated method stub
		List<Blooduser> list = new ArrayList<>();
		String sql = "select * from blooduser where DRegisteId='"+id+"'";
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		query.addEntity(Blooduser.class);

		list = query.list();
		if(list.size()==0){
			return null;
		}else{
			Blooduser blooduser=list.get(0);
			return blooduser;
		}
		
		//System.out.println("=========================================22222222");

		

	}

	@Override
	public void save(Blooduser blooduser) {
		// TODO Auto-generated method stub
	
		sessionFactory.getCurrentSession().save(blooduser);
		
	}

}
