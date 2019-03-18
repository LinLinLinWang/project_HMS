package niit.hospitalsys.dao.imp;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import niit.hospitalsys.dao.AnswerQuestionDao;
import niit.hospitalsys.entity.Answerquestion;
import niit.hospitalsys.entity.Eachmoney;

@Repository
public class AnswerQuestionDaoImp implements AnswerQuestionDao {
	@Resource
	SessionFactory sessionFactory;

	@Override
	public void save(Answerquestion question) {

		sessionFactory.getCurrentSession().save(question);
	}

	@Override
	public Answerquestion findById(String id) {
		// TODO Auto-generated method stub
		List<Answerquestion> list = new ArrayList<>();

		String sql = "select * from answerquestion where RegisteId ='" + id + "'";
		System.out.println(sql);
		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		query.addEntity(Answerquestion.class);

		list = query.list();
		Answerquestion answerquestion =new Answerquestion();
		if (list.size() == 0) {

		} else {
			answerquestion = list.get(0);
		}
		System.out.println("=========================================22222222");

		return answerquestion;

	}

}
