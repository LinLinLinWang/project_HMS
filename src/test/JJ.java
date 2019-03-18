package test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.Test;

import com.sun.mail.util.MailSSLSocketFactory;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;



public class JJ {
	@Test
  public void  JJ() throws GeneralSecurityException, MessagingException{
		Properties props = new Properties();
        
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
        msg.setSubject("主题");
        StringBuilder builder = new StringBuilder();
        builder.append("胡子&小猿的博客:");
        builder.append("url = " + "http://www.cnblogs.com/hzxy-blog/");
        msg.setText(builder.toString());
        msg.setFrom(new InternetAddress("1339567630@qq.com"));
     
        Transport transport = session.getTransport();
        transport.connect("smtp.qq.com", "1339567630@qq.com", "lmhumbrvqzftjfac");
     
        transport.sendMessage(msg, new Address[] { new InternetAddress("1064214328@qq.com") });
        transport.close();
	  
	}

  
  
}
