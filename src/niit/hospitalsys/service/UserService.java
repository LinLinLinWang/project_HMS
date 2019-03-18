package niit.hospitalsys.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;
import niit.hospitalsys.dao.imp.UserDaoImp;
import niit.hospitalsys.entity.User;

@Service
public class UserService {
	@Resource
	UserDaoImp userDaoImp;

	// 对user表进行插入
	public void saveUser(User user) {
		userDaoImp.save(user);

	}

	//根据id进行查找user
	public User findById(String uregisteid) {
		User user = new User();
		user = userDaoImp.findById(uregisteid);
		return user;
	}

	//根据手机号进行遍历
	public List<User> findByNumber(String number) {

		List<User> list = new ArrayList<User>();
		list = userDaoImp.findByNumber(number);
		return list;
	}
	public void update(User u) {
		// TODO Auto-generated method stub
		//hibernateTemplate.update(u);
		userDaoImp.update(u);

	}
	public List<User> findByType(int type) {
		// TODO Auto-generated method stub
		
	       
	    
		return userDaoImp.findByType(type);
		
	}
	
	public List<User> findAll() {
	
       
		return userDaoImp.findAll();
	}




}
