package niit.hospitalsys.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;

import niit.hospitalsys.dao.imp.AnswerQuestionDaoImp;
import niit.hospitalsys.entity.Answerquestion;
@Service
public class AnswerQuestionService {
	  @Resource
	  AnswerQuestionDaoImp  answerQuestionDaoImp;
	   public void save(Answerquestion question){
		   
		   answerQuestionDaoImp.save(question);
		   
	   }
	   public Answerquestion findById(String id) {
			// TODO Auto-generated method stub
			
			return answerQuestionDaoImp.findById(id);

		}
}
