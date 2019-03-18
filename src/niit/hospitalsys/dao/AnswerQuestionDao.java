package niit.hospitalsys.dao;

import niit.hospitalsys.entity.Answerquestion;

public interface AnswerQuestionDao {
	// 保存问题
	void save(Answerquestion question);

	Answerquestion findById(String id);
}
