package niit.hospitalsys.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.DoctorDao;
import niit.hospitalsys.entity.Doctor;

@Repository
public class DoctorDaoImp implements DoctorDao {
	@Resource
	SessionFactory sessionFactory;

	@Override
	public void save(Doctor doctor) {
		sessionFactory.getCurrentSession().save(doctor);

	}

	@Override
	public Doctor findById(String uregisteid) {

		String sql = "select * from doctor where DRegisteId='" + uregisteid + "'";

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(Doctor.class);

		List<Doctor> list = query.list();
		System.out.println("该注册号==========" + list.size());
		Doctor doctor = new Doctor();
		if (list.size() == 0) {
			System.out.println("查询不到该医生");
			doctor = null;
		} else {
			doctor = list.get(0);
		}

		return doctor;
	}

	@Override
	public List<Doctor> findAll() {

		String sql = "select * from doctor";
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		System.out.println("====1===========");
		query.addEntity(Doctor.class);
		System.out.println("====2===========");
		List<Doctor> list = query.list();
		System.out.println("====3===========");
		if (list == null) {
			System.out.println("====4===========");
		} else {
			System.out.println("====5===========");
		}
		System.out.println("====6===========");

		return list;
	}

	@Override
	public List<Doctor> findByOfficeId(int OfficeId) {

		String sql = "select * from doctor where DOfficeld=" + OfficeId;
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		System.out.println("====1===========");
		query.addEntity(Doctor.class);
		System.out.println("====2===========");
		List<Doctor> list = query.list();
		System.out.println("====3===========");
		if (list.size()==0) {
			System.out.println("====4===========");
			return null;
		} else {
			return list;
		}
		
		
	}

	@Override
	public void delete(Doctor doctor) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(doctor);

		
	}

}
