package niit.hospitalsys.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.mail.util.MailSSLSocketFactory;

import niit.hospitalsys.entity.Eachmoney;
import niit.hospitalsys.service.EachMoneyService;

@Controller
public class UpdateEachMoneyController {
	@Resource
	EachMoneyService eachMoneyService;

	@RequestMapping(value = "ajax/uodatemedicine1.mvc")
	public @ResponseBody Map<String, Object> uopdatemedicine(HttpServletRequest request, HttpServletResponse response)
			throws IOException, GeneralSecurityException, MessagingException {

		String mid_m = request.getParameter("mid_m");
		String mname_m = request.getParameter("mname_m");
		String mmoney_m = request.getParameter("mmoney_m");
		String mcount_m = request.getParameter("mcount_m");
		Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(mid_m));
		eachmoney.setMname(mname_m);
		eachmoney.setMmoney(Float.parseFloat(mmoney_m));
		eachmoney.setMcount(mcount_m);
		eachMoneyService.update(eachmoney);
		List<Eachmoney> medicineList = new ArrayList<>();
		medicineList = eachMoneyService.findBytype(2);
		request.getSession().setAttribute("medicineList", medicineList);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
}
