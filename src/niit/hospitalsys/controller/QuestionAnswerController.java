package niit.hospitalsys.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import niit.hospitalsys.entity.Answerquestion;
import niit.hospitalsys.entity.User;
import niit.hospitalsys.service.AnswerQuestionService;
import niit.hospitalsys.service.MD5;
import niit.hospitalsys.service.UserService;

@Controller
public class QuestionAnswerController {
	// 注入服务对象

	@Resource
	AnswerQuestionService answerQuestionService;
	@Resource
	UserService userService;
	@Resource
	MD5 mD5;

	@RequestMapping(value = "ajax/consummate_question_answer.mvc")
	public @ResponseBody Map<String, Object> login2(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String registeCode = request.getParameter("regesiteCode");
		String question = request.getParameter("question");

		String answer = request.getParameter("answer");
		System.out.println(registeCode + "的人设置的问题是" + question + "答案设置成" + answer);

		Map<String, Object> map = new HashMap<String, Object>();
		Answerquestion answerQuestion = new Answerquestion();

		answerQuestion.setRegisteId(registeCode);
		answerQuestion.setQuestion(question);
		answerQuestion.setAnswer(answer);

		answerQuestion.setUser(userService.findById(registeCode));
		try {
			answerQuestionService.save(answerQuestion);
			map.put("question_answer", "true");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("question_answer", "false");
		}

		return map;
	}

	@RequestMapping(value = "ajax/sumitanser.mvc")
	public @ResponseBody Map<String, Object> sumitanser(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		//String uid = request.getParameter("uid");
		String answer = request.getParameter("answer");

        
		Map<String, Object> map = new HashMap<String, Object>();
	     String uid=(String)request.getSession().getAttribute("questionid");
			if (null == answerQuestionService.findById(uid).getAnswer()) {
				map.put("isok", "no");
			} else {
				if (answerQuestionService.findById(uid).getAnswer().equals(answer)) {
					map.put("isok", "yes");
				} else {
					map.put("isok", "no");
				}
			

		}

		return map;
	}
	
	@RequestMapping(value = "ajax/restpassword.mvc")
	public @ResponseBody Map<String, Object> restpassword(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		//String uid = request.getParameter("uid");
		  String uid=(String)request.getSession().getAttribute("questionid");
		  String password=request.getParameter("password");
		  System.out.println(password);
		String dd=  mD5.MD5(password);
         User user=userService.findById(uid);
         user.setUpwd(dd);
         userService.update(user);
         
        
        
     	Map<String, Object> map = new HashMap<String, Object>();
	

		return map;
	}

}
