package niit.hospitalsys.dao.imp;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.UserDao;
import niit.hospitalsys.entity.User;

@Repository
public class UserDaoImp implements UserDao {
	// @Resource(name="hibernateTemplate")

	// HibernateTemplate hibernateTemplate;
	@Resource
	SessionFactory sessionFactory;

	@Override
	public void save(User u) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(u);
		// hibernateTemplate.save(u);
	}

	@Override
	public void update(User u) {
		// TODO Auto-generated method stub
		// hibernateTemplate.update(u);
		sessionFactory.getCurrentSession().update(u);
	}

	@Override
	public void delete(String uregisteid) {
		// TODO Auto-generated method stub
		// hibernateTemplate.delete(findById(uregisteid));
	}

	@Override
	public List<User> findAll() {
		String sql = "select * from user";

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(User.class);

		List<User> list = query.list();

		return list;
	}

	@Override
	public User findById(String uregisteid) {

		String sql = "select * from user where URegisteId='" + uregisteid + "'";

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(User.class);

		List<User> list = query.list();
		System.out.println("当前集合长度user" + list.size());
		User user = new User();
		if (list.size() == 0) {
			return null;
		} else {
			user = list.get(0);
			 return user;
		}

	}

	// 根据手机号遍历用户集合
	@Override
	public List<User> findByNumber(String number) {
		String sql = "select * from user where UPhone='" + number + "'";

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(User.class);

		List<User> list = query.list();
		System.out.println("手机号为" + number + "的注册号有" + list.size() + "个");

		return list;
	}

	@Override
	public List<User> findByType(int type) {
		// TODO Auto-generated method stub
		String sql = "select * from user where UType=" + type;

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.addEntity(User.class);

		List<User> list = query.list();

		return list;

	}

}
