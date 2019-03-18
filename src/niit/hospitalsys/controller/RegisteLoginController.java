package niit.hospitalsys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import niit.hospitalsys.entity.Doctor;
import niit.hospitalsys.entity.Eachmoney;
import niit.hospitalsys.entity.Entitler;
import niit.hospitalsys.entity.Office;
import niit.hospitalsys.entity.Patienthistory;
import niit.hospitalsys.entity.User;
import niit.hospitalsys.service.AnswerQuestionService;
import niit.hospitalsys.service.CountAge;
import niit.hospitalsys.service.DoctorService;
import niit.hospitalsys.service.EachMoneyService;
import niit.hospitalsys.service.EntitlerService;
import niit.hospitalsys.service.MD5;
import niit.hospitalsys.service.OfficeService;
import niit.hospitalsys.service.PatienthistoryService;
import niit.hospitalsys.service.RandomForRegiste;
import niit.hospitalsys.service.UserService;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller

public class RegisteLoginController {
	@Resource
	RandomForRegiste randomRegiste;
	@Resource
	CountAge countage;
	@Resource
	MD5 md5;
	// 引入服务层
	@Resource
	UserService userService;
	@Resource
	OfficeService officeService;
	@Resource
	EntitlerService entitlerService;
	@Resource
	EachMoneyService eachMoneyService;
	String registeCode;
	@Resource
	DoctorService doctorService;
	@Resource
	AnswerQuestionService answerQuestionService;
	@Resource
	PatienthistoryService patienthistoryService;

	// @Autowired
	// private HttpServletRequest request;
	// @Autowired
	// private HttpServletResponse response;
	// 获取前台数据测试
	@RequestMapping(value = "ajax/registe.mvc")
	public @ResponseBody Map<String, Object> registe(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		System.out.println("身份证" + request.getParameter("uid"));
		String uid = request.getParameter("uid");
		System.out.println("姓名" + request.getParameter("name"));
		String name = request.getParameter("name");
		System.out.println("性别" + request.getParameter("gender"));
		String gender = request.getParameter("gender");
		System.out.println("手机号" + request.getParameter("number"));
		String number = request.getParameter("number");
		System.out.println("邮箱" + request.getParameter("email"));
		String email = request.getParameter("email");
		System.out.println("地址" + request.getParameter("address"));
		String address = request.getParameter("address");
		System.out.println("密码" + request.getParameter("password"));
		String password = request.getParameter("password");
		System.out.println("类型" + request.getParameter("type"));
		String type = request.getParameter("type");
		System.out.println("验证码输入" + request.getParameter("code"));
		String code = request.getParameter("code");

		registeCode = RandomForRegiste.getRandom();
		Map<String, Object> map = new HashMap<String, Object>();

		HttpSession session = request.getSession();
		String true_code = (String) session.getAttribute("key");
		System.out.println("当前实际验证码" + true_code);
		System.out.println("当前注册码" + RandomForRegiste.getRandom());
		User user = new User();
		user.setUregisteId(registeCode);
		user.setUid(uid);
		// 进行密码md5加密
		String md5_password = MD5.MD5(password);
		System.out.println("用户MD5加密后的密码为" + md5_password);
		user.setUpwd(md5_password);
		user.setUname(name);
		if (gender.equals("0")) {
			String true_gender = "男";
			user.setUgender(true_gender);
		} else {
			String true_gender = "女";
			user.setUgender(true_gender);
		}
		// 计算真实年龄
		String true_age = countage.countAge(uid);
		user.setUage(Integer.valueOf(true_age));
		user.setUemail(email);
		user.setUphone(number);
		user.setUaddress(address);
		user.setUtype(Integer.valueOf(type));
		// 判断是不是医生
		// 如果是医生 将会跳转到医生完善信息界面（科室 以及 职称）
		// 当前手机号码的数目
		if (type.endsWith("0")) {
			map.put("IsDoctor", "false");
		} else {
			map.put("IsDoctor", "true");
		}
		int numberCount = userService.findByNumber(number).size();
		if (numberCount == 0 && true_code.endsWith(code)) {
			// 通过条件
			System.out.println("当前手机号注册人数" + numberCount);
			userService.saveUser(user);

			System.out.println("注册成功");

			// 查询出医生列表职称跟科室
			List<Office> officeList = officeService.findAllOffice();
			List<Entitler> entitlerList = entitlerService.findAllEntitler();
			map.put("registeCode", registeCode);
			map.put("IsPhoneOnly", "true");
			map.put("IsTrueCode", "true");
			map.put("IsTrueCode", "true");
			request.getSession().setAttribute("officeList", officeList);
			request.getSession().setAttribute("entitlerList", entitlerList);
		} else {
			if (numberCount > 0 && true_code.endsWith(code)) {
				// 该手机已经注册过了
				map.put("IsPhoneOnly", "false");
				map.put("IsTrueCode", "true");
			} else {
				map.put("IsPhoneOnly", "false");
				map.put("IsTrueCode", "false");

			}

		}

		return map;

	}

	// ==================注册医生信息===============================
	@RequestMapping(value = "RegisteDocotor.mvc", method = RequestMethod.POST)
	public String registeDoctor(String entitler, String office, HttpServletRequest req, HttpSession session,
			ModelMap map) {
		Doctor doctor = new Doctor();
		doctor.setDregisteId(registeCode);
		doctor.setUser(userService.findById(registeCode));
		doctor.setEntitler(entitlerService.findById(Integer.valueOf(entitler)));
		doctor.setOffice(officeService.findById(Integer.valueOf(office)));
		System.out.println("当前医生选择的科室号是" + office);
		System.out.println("当前医生选择的职称号是" + entitler);
		System.out.println("开始保存医生");
		doctorService.save(doctor);
		System.out.println("保存医生成功");
		map.addAttribute("doictorregesite", registeCode);
		return "consummate_question.jsp";
	}

	// ========================登陆===============================================//
	@RequestMapping(value = "ajax/login.mvc")
	public @ResponseBody Map<String, Object> login2(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		String uid = request.getParameter("uid");
		String password = request.getParameter("password");
		String savestate = request.getParameter("savestate");
		System.out.println("用户账号" + uid + "密码" + password);
		// 加密后的密码
		String md5_password = MD5.MD5(password);
		System.out.println("加密后的密码" + md5_password);
		if (uid.length() < 16) {
			// 选择手机登陆
			List<User> userList = new ArrayList<>();
			userList = userService.findByNumber(uid);
			if (userList.size() != 0) {
				map.put("IsRegisted", "true");
				if (userList.get(0).getUpwd().equals(md5_password)) {
					List<Office> officeList = officeService.findAllOffice();
					List<Entitler> entitlerList = entitlerService.findAllEntitler();
					System.err.println("====" + entitlerList.get(0).getDentitleName());
					request.getSession().setAttribute("officeList", officeList);
					request.getSession().setAttribute("entitlerList", entitlerList);
					map.put("IsTruePassword", "true");

					// 是否进行cookie保存
					if ("true".equals(savestate)) {
						// 进行保存
						String host = request.getServerName();
						Cookie cookie = new Cookie("SESSION_LOGIN_USERNAME", uid); // 保存用户名到Cookie
						cookie.setPath("/");
						cookie.setDomain(host);
						cookie.setMaxAge(99999999);
						response.addCookie(cookie);

						cookie = new Cookie("SESSION_LOGIN_PASSWORD", md5_password);
						cookie.setPath("/");
						cookie.setDomain(host);
						cookie.setMaxAge(99999999);
						response.addCookie(cookie);

					} else {
						System.out.println("大家对于cookie就当无事发生");

					}

					request.getSession().setAttribute("current_login_user", userList.get(0));
					if (userList.get(0).getUtype() == 1) {
						map.put("IsDoctor", "true");
					} else {
						map.put("IsDoctor", "false");
					}

				} else {
					map.put("IsTruePassword", "false");

				}

			} else {
				// 没这个人
				map.put("IsRegisted", "false");

			}

		} else {

			// 选择注册号登陆
			User user = new User();
			try {
				user = userService.findById(uid);
				map.put("IsRegisted", "true");
				if (user.getUpwd().equals(md5_password)) {
					List<Office> officeList = officeService.findAllOffice();
					List<Entitler> entitlerList = entitlerService.findAllEntitler();
					System.err.println("====" + entitlerList.get(0).getDentitleName());
					request.getSession().setAttribute("officeList", officeList);
					request.getSession().setAttribute("entitlerList", entitlerList);
					map.put("IsTruePassword", "true");
					// 是否进行cookie保存
					if ("true".equals(savestate)) {
						// 进行保存
						String host = request.getServerName();
						Cookie cookie = new Cookie("SESSION_LOGIN_USERNAME", uid); // 保存用户名到Cookie
						cookie.setPath("/");
						cookie.setDomain(host);
						cookie.setMaxAge(99999999);
						response.addCookie(cookie);

						cookie = new Cookie("SESSION_LOGIN_PASSWORD", md5_password);
						cookie.setPath("/");
						cookie.setDomain(host);
						cookie.setMaxAge(99999999);
						response.addCookie(cookie);

					} else {
						System.out.println("大家对于cookie就当无事发生");

					}

					request.getSession().setAttribute("current_login_user", user);
					if (user.getUtype() == 0) {
						map.put("IsDoctor", "false");
					} else {
						map.put("IsDoctor", "true");
					}
				} else {
					map.put("IsTruePassword", "false");

				}
			} catch (Exception e) {
				System.out.println("获取失败 应该是没有该注册号注册过");
				map.put("IsRegisted", "false");
			}

		}

		return map;
	}

	// ================上传头像====================================================//
	@RequestMapping(value = "ajax/uploadimage.mvc")
	public @ResponseBody Map<String, Object> uploadimage(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取前段截取的图片

		response.setContentType("text/html");
		String dataurl = request.getParameter("image");
		System.out.println("图片数据" + dataurl);
		String imgcontent = dataurl.substring(27, dataurl.length() - 2);
		System.out.println("裁剪后图片数据" + imgcontent);
		// 设置保存路径
		String uregistecode = ((User) request.getSession().getAttribute("current_login_user")).getUregisteId();
		// 获取上下文路径
		// String
		// path=request.getSession().getServletContext().getRealPath("/");

		// String path = t+"\\webapp\\images\\doctorimg\\"+uregistecode+".png";
		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		int num = t.indexOf(".metadata");
		String path = "C:\\dede\\images\\doctorimg\\" + uregistecode + ".png";
		System.err.println(path);
		base64StrToImage(imgcontent, path);
		System.out.println("ddddddd==dddddddd");
		map.put("finish", "true");
		return map;

	}

	public static boolean base64StrToImage(String imgStr, String path) {
		if (imgStr == null)
			return false;
		BASE64Decoder decoder = new BASE64Decoder();

		try {
			// 解密
			byte[] b = decoder.decodeBuffer(imgStr);
			// 处理数据
			for (int i = 0; i < b.length; ++i) {
				System.out.println("");
				if (b[i] < 0) {
					b[i] += 256;
				}
			}
			// 文件夹不存在则自动创建
			File tempFile = new File(path);
			if (!tempFile.getParentFile().exists()) {
				tempFile.getParentFile().mkdirs();
			}
			OutputStream out = new FileOutputStream(tempFile);
			System.out.println("开始开始写入");
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	//////////// ====修改个人信息=============//
	@RequestMapping(value = "updateinfo.mvc")
	public String updateinfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		System.out.println("userName is:" + userName);
		System.out.println("userPwd is:" + email);
		User user = (User) request.getSession().getAttribute("current_login_user");
		user.setUemail(email);
		user.setUname(userName);
		user.setUaddress(address);

		userService.update(user);
		HttpSession session = request.getSession();

		// response.sendRedirect("patient_face.jsp");
		return "search.html";
	}
	// 修改密码-=====、

	@RequestMapping(value = "ajax/updatepassword.mvc")
	public @ResponseBody Map<String, Object> updatepassword(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		Map<String, Object> map = new HashMap<String, Object>();

		String password = request.getParameter("password1");
		String password1 = request.getParameter("password2");

		User user = (User) request.getSession().getAttribute("current_login_user");
		if (md5.MD5(password).equals(user.getUpwd())) {
			user.setUpwd(md5.MD5(password1));
			userService.update(user);
			map.put("istruepass", "yes");
		} else {
			map.put("istruepass", "no");

		}
		return map;

	}

	// findpassword
	@RequestMapping(value = "ajax/findpassword.mvc")
	public @ResponseBody Map<String, Object> findpassword(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		Map<String, Object> map = new HashMap<String, Object>();
		String uid = request.getParameter("uid");
		if (uid.length() > 17) {
			// 用的是注册号搜寻
			if (null == userService.findById(uid)) {
				System.out.println("没有这个人");
				map.put("havathis", "no");

			} else {
				map.put("havathis", "yes");
				if (null == answerQuestionService.findById(uid).getQuestion()) {
					map.put("havequese", "no");
				} else {
					request.getSession().setAttribute("question", answerQuestionService.findById(uid));
					request.getSession().setAttribute("questionid", uid);

					map.put("havequese", "yes");
				}

			}

		} else {
			// 用的是手机号搜寻
			System.out.println("shouji");
			if (0 == userService.findByNumber(uid).size()) {
				map.put("havathis", "no");

			} else {
				map.put("havathis", "yes");
				String puid = userService.findByNumber(uid).get(0).getUregisteId();
				if (null == answerQuestionService.findById(puid).getQuestion()) {
					map.put("havequese", "no");
				} else {
					request.getSession().setAttribute("question", answerQuestionService.findById(puid));
					request.getSession().setAttribute("questionid", puid);

					map.put("havequese", "yes");
				}

			}

		}

		return map;

	}

	// get changeGrand list
	@RequestMapping(value = "ajax/changeGrand.mvc")
	public @ResponseBody Map<String, Object> changeGrand(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> userlist = userService.findByType(1);
		request.getSession().setAttribute("docotorlist2", userlist);
		if (((User) request.getSession().getAttribute("current_login_user")).getUtype() == 2) {
			map.put("isBoos", "yes");
		} else {
			map.put("isBoos", "no");
		}
		return map;

	}

	// change changeGrand list
	@RequestMapping(value = "ajax/Grand.mvc")
	public @ResponseBody Map<String, Object> Grand(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		Map<String, Object> map = new HashMap<String, Object>();

		String redi = request.getParameter("refiste");
		User user = userService.findById(redi);

		user.setUtype(0);
		userService.update(user);
		// 同时删掉医生列表中的记录
		Doctor doctor = new Doctor();
		doctor = doctorService.findById(redi);
		doctorService.delete(doctor);
		List<User> userlist = userService.findByType(1);

		request.getSession().setAttribute("docotorlist2", userlist);

		return map;

	}
	// 搜索以及发送邮件

	@RequestMapping(value = "ajax/serarchandemail.mvc")
	public @ResponseBody Map<String, Object> serarchandemail(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html");
		List<User> list = new ArrayList<>();
		list = userService.findAll();
		request.getSession().setAttribute("alllist", list);

		Map<String, Object> map = new HashMap<String, Object>();
		if (((User) request.getSession().getAttribute("current_login_user")).getUtype() == 2) {
			map.put("isBoos", "yes");
		} else {
			map.put("isBoos", "no");
		}
		return map;

	}

	@RequestMapping(value = "sessioninvalidate.mvc")
	public String sessioninvalidate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");

		
		
		Cookie[] cookies = request.getCookies();
	      try
	      {
	           for(int i=0;i<cookies.length;i++)  
	           {
	        	   
	        	   if(cookies[i].getName().equals("SESSION_LOGIN_USERNAME")){
	        		   cookies[i].setMaxAge(0);
	        		   cookies[i].setPath("/");//根据你创建cookie的路径进行填写    
	   	              response.addCookie(cookies[i]);
	        	   }
	        	   if(cookies[i].getName().equals("SESSION_LOGIN_PASSWORD")){
	        		   cookies[i].setMaxAge(0);
	        		   cookies[i].setPath("/");//根据你创建cookie的路径进行填写    
	   	              response.addCookie(cookies[i]);
	        	   }
//	            //System.out.println(cookies[i].getName() + ":" + cookies[i].getValue());
//	            Cookie cookie = new Cookie(cookies[i].getName(), null);
//	            cookie.setMaxAge(0);
//	            cookie.setPath("/");//根据你创建cookie的路径进行填写    
//	            response.addCookie(cookie);
//	            System.err.println("清空"+cookies[i].getName());
//	            System.err.println("清空Cookiesing！");
	           }
	      }catch(Exception ex)
	      {
	           System.out.println("清空Cookies发生异常！");
	      } 
	
	request.getSession().invalidate();
	System.out.println("清理完毕");
	//request.getSession().setAttribute("current_login_user", null); 
		return "redirect:index.mvc";

	}

	// 默认页进入时获取医生列表 科室列表 检查列表
	@RequestMapping(value = "index.mvc")
	public ModelAndView hello(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView("index.jsp");
		// 将数据放置到ModelAndView对象view中,第二个参数可以是任何java类型
//		ServletRequestAttributes ra = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//		HttpServletRequest request = ra.getRequest();
//		// 检查是否存在cookie记录
//		
		String usernameCookie = null;
		String passwordCookie = null;
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
		
				for (Cookie cookie : cookies) {
					if ("SESSION_LOGIN_USERNAME".equals(cookie.getName())) {
						usernameCookie = cookie.getValue(); // 得到cookie的用户名
						System.err.println("cookie"+usernameCookie);
					}
					if ("SESSION_LOGIN_PASSWORD".equals(cookie.getName())) {
						passwordCookie = cookie.getValue(); // 得到cookie的密码
						System.err.println("cookie"+passwordCookie);
					}
					if (null == usernameCookie || passwordCookie == null) {
                                     System.err.println("");
					} else {
						if (usernameCookie.length() < 16) {
							// 选择手机登陆
							List<User> userList = new ArrayList<>();
							userList = userService.findByNumber(usernameCookie);
							if (userList.size() != 0) {

								if (userList.get(0).getUpwd().equals(passwordCookie)) {
									List<Office> officeList = officeService.findAllOffice();
									List<Entitler> entitlerList = entitlerService.findAllEntitler();
									System.err.println("====" + entitlerList.get(0).getDentitleName());
									request.getSession().setAttribute("officeList", officeList);
									request.getSession().setAttribute("entitlerList", entitlerList);
									request.getSession().setAttribute("current_login_user", userList.get(0));
									

								}
							}

						} else {

							// 选择注册号登陆
							User user = new User();
							try {
								user = userService.findById(usernameCookie);

								if (user.getUpwd().equals(passwordCookie)) {
									List<Office> officeList = officeService.findAllOffice();
									List<Entitler> entitlerList = entitlerService.findAllEntitler();
									System.err.println("====" + entitlerList.get(0).getDentitleName());
									request.getSession().setAttribute("officeList", officeList);
									request.getSession().setAttribute("entitlerList", entitlerList);

									request.getSession().setAttribute("current_login_user", user);
									
								}

							} catch (Exception e) {
								// TODO: handle exception
							}
						}

					}

				}

			

		} else {

			System.out.println("cookie为空");
		}

		// 获取医生相关信息
		// 姓名 年龄 科室 职称 照片 注册号
		List<Doctor> docotorlist = new ArrayList<>();
		docotorlist = doctorService.findAll();
		List<String[]> eachlist = new ArrayList<>();
		for (int i = 0; i < docotorlist.size(); i++) {
			String eachdoctor[] = new String[7];

			String registe = docotorlist.get(i).getDregisteId();
			String name = userService.findById(registe).getUname();
			String officename = docotorlist.get(i).getOffice().getDofficeName();
			String entitlename = docotorlist.get(i).getEntitler().getDentitleName();
			String age = userService.findById(registe).getUage() + "";
			String gender = userService.findById(registe).getUgender();
			eachdoctor[0] = registe;
			eachdoctor[1] = name;
			eachdoctor[2] = officename;
			eachdoctor[3] = entitlename;
			eachdoctor[4] = age;
			eachdoctor[5] = gender;
			eachlist.add(eachdoctor);
			System.out.println("打印集合中每一条元素" + eachlist.get(i)[0] + eachlist.get(i)[1] + eachlist.get(i)[2]);

		}
		List<Office> officelist = new ArrayList<>();
		List<String[]> officek = new ArrayList<>();
		officelist = officeService.findAllOffice();
		for (int i = 0; i < officelist.size(); i++) {
			try {
				String office[] = new String[7];
				String officd = officelist.get(i).getDofficeld() + "";
				String officename = officelist.get(i).getDofficeName();
				String people = doctorService.findByOfficeId(Integer.valueOf(officd)).size() + "";
				office[0] = officd;
				office[1] = officename;
				office[2] = people;
				officek.add(office);

			} catch (Exception e) {
				// TODO: handle exception
			}

		}

		// 获取检查明细
		List<Eachmoney> pchecklist = new ArrayList<>();
		List<String[]> checki = new ArrayList<>();
		pchecklist = eachMoneyService.findAll();
		for (int i = 0; i < pchecklist.size(); i++) {
			String check[] = new String[7];
			String checkid = pchecklist.get(i).getMid() + "";
			String checkname = pchecklist.get(i).getMname();
			String checkmoney = pchecklist.get(i).getMmoney() + "";
			check[0] = checkid;
			check[1] = checkname;
			check[2] = checkmoney;
			checki.add(check);

		}
		pchecklist = eachMoneyService.findBytype(0);
		view.addObject("doctor", eachlist);
		view.addObject("officelist", officek);
		view.addObject("pchecklist", checki);
		view.addObject("2", "2");

		return view;
	}

}
