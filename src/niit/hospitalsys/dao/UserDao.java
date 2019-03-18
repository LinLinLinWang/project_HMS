package niit.hospitalsys.dao;

import java.util.List;

import niit.hospitalsys.entity.User;



public interface UserDao {
	//对user表进行操作
	void save(User u);

	void update(User u);

	void delete(String uregisteid);

	List<User> findAll();

	User findById(String uregisteid);
	//根据手机号遍历用户集合
	List<User> findByNumber(String number);
	List<User> findByType(int  type);
	
}
