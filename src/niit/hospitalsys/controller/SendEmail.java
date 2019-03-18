package niit.hospitalsys.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.mail.util.MailSSLSocketFactory;

import niit.hospitalsys.entity.Doctor;

@Controller
public class SendEmail {

	@RequestMapping(value = "ajax/sendEmail.mvc")
	public @ResponseBody Map<String, Object> sendEmail(HttpServletRequest request, HttpServletResponse response)
			throws IOException, GeneralSecurityException, MessagingException {
		Properties props = new Properties();

		String emailto = request.getParameter("toemail");
		String Message = request.getParameter("Message");
		String mailtitle = request.getParameter("mailtitle");

		Map<String, Object> map = new HashMap<String, Object>();
		// 开启debug调试
		props.setProperty("mail.debug", "true");
		// 发送服务器需要身份验证
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器主机名
		props.setProperty("mail.host", "smtp.qq.com");
		// 发送邮件协议名称
		props.setProperty("mail.transport.protocol", "smtp");

		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);

		Session session = Session.getInstance(props);

		Message msg = new MimeMessage(session);
		msg.setSubject(mailtitle);
		StringBuilder builder = new StringBuilder();
		builder.append("JDK医院管理系统测试项目");
		builder.append(Message);
		msg.setText(builder.toString());
		msg.setFrom(new InternetAddress("1339567630@qq.com"));

		Transport transport = session.getTransport();
		transport.connect("smtp.qq.com", "1339567630@qq.com", "lmhumbrvqzftjfac");

		transport.sendMessage(msg, new Address[] { new InternetAddress(emailto) });
		transport.close();
		
		return map;
	}

}
