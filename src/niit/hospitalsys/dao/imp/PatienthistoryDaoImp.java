package niit.hospitalsys.dao.imp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.PatienthistoryDao;
import niit.hospitalsys.entity.Patienthistory;
import niit.hospitalsys.service.UserService;

@Repository

public class PatienthistoryDaoImp implements PatienthistoryDao {
	@Resource

	SessionFactory sessionFactory;
	@Resource
	UserService userService;

	@Override
	public void save(Patienthistory patienthistory) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(patienthistory);

	}

	@Override
	public List findAll(String dregiste, Date nowtime) {

		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 更改时间格式
		String nowtime2 = format1.format(nowtime);
		System.out.println("当前时间" + nowtime2);
		String sql = "select * from patienthistory where DRegisteId=" + "\"" + dregiste
				+ "\" and round((UNIX_TIMESTAMP(PComeHospitalTime)-UNIX_TIMESTAMP(" + "'" + nowtime2 + "'"
				+ ")))/(60*60)>=0 and round((UNIX_TIMESTAMP(PComeHospitalTime)-UNIX_TIMESTAMP(" + "'" + nowtime2 + "'"
				+ ")))/(60*60)<=17";
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(Patienthistory.class);

		List<Patienthistory> list = query.list();
		List detailelist = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			// 该病人历史记录号
			int phid = list.get(i).getPhid();
			// 病人的注册号
			String pregiste = list.get(i).getPregisteId();
			// 病人预约时间

			String appointTime = format1.format(list.get(i).getPcomeHospitalTime());
			// 病人姓名
			String pname = userService.findById(pregiste).getUname();
			int page = userService.findById(pregiste).getUage();
			String pgender = userService.findById(pregiste).getUgender();
			String pnumber = userService.findById(pregiste).getUphone();
			String pemail = userService.findById(pregiste).getUemail();
			String paddress = userService.findById(pregiste).getUaddress();
			String uid = userService.findById(pregiste).getUid();
			String[] test3 = new String[] { phid + "", pregiste, pname, pgender, page + "", appointTime, uid, pnumber,
					pemail, paddress };
			detailelist.add(test3);

		}
		System.out.println("集合长度=======" + detailelist.size());

		return detailelist;

	}

	@Override
	public boolean updatePation(Patienthistory patienthistory) {
		// TODO Auto-generated method stub
		try {

			sessionFactory.getCurrentSession().saveOrUpdate(patienthistory);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}

	}

	@Override
	public Patienthistory findByHid(String hid) {
		// TODO Auto-generated method stub
		int hid1 = Integer.valueOf(hid);
		String sql = "select * from patienthistory where PHId=" + hid1;

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(Patienthistory.class);

		List<Patienthistory> list = query.list();
		System.out.println("当前集合长度user" + list.size());
		Patienthistory patienthistory = list.get(0);
		return patienthistory;

	}

	@Override
	public List<Patienthistory> findByTypeAndResgite(int type, String registe) {
		// TODO Auto-generated method stub

		String sql = "select * from patienthistory where PMoneyType=" + type + " and PRegisteId =" + "\"" + registe
				+ "\"";

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(Patienthistory.class);

		List<Patienthistory> list = query.list();

		return list;
	}

	@Override
	public List<Patienthistory> findByResgite(String registe) {
		// TODO Auto-generated method stub
		String sql = "select * from patienthistory where  PRegisteId ='" + registe + "'";
		System.out.println(sql);
		// SessionFactory sessionFactory1=sessionFactory;
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		query.addEntity(Patienthistory.class);

		List<Patienthistory> list = query.list();

		return list;
	}

	@Override
	public List<Patienthistory> findByType(int type) {
		// TODO Auto-generated method stub
		String sql = "select * from patienthistory where  PMoneyType =" + type;
		System.out.println(sql);
		// SessionFactory sessionFactory1=sessionFactory;
		// Session session=sessionfactory.getCurrentSession();

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(Patienthistory.class);

		List<Patienthistory> list = query.list();
		return list;
	}

	@Override
	public List<Patienthistory> findByHompitaltime() {
		// TODO Auto-generated method stub

		String sql = "select * from patienthistory where PHomeHosptial is not null and POutHosptial  is null";

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(Patienthistory.class);

		List<Patienthistory> list = query.list();

		return list;
	}

}
