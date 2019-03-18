package niit.hospitalsys.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.expression.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import niit.hospitalsys.entity.Doctor;
import niit.hospitalsys.entity.Patienthistory;
import niit.hospitalsys.entity.User;
import niit.hospitalsys.service.DoctorService;
import niit.hospitalsys.service.PatienthistoryService;

@Controller
public class AppointmentController {
	@Resource
	PatienthistoryService patienthistoryService;
	@Resource
	DoctorService doctorService;

	@RequestMapping(value = "ajax/appointment.mvc")
	public @ResponseBody Map<String, Object> appoint(HttpServletRequest request, HttpServletResponse response)
			throws IOException, java.text.ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		String date = request.getParameter("date");
		System.out.println("预约" + date);
		String doctorid = request.getParameter("doctorId");
		System.out.println("预约医生" + doctorid);
		String time1 = request.getParameter("time1");
		System.out.println("预约时间" + time1);
		String complettime = date + " " + time1 + ":00";
		System.out.println("时间" + complettime);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d1;
		try {
			d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(complettime);
			// 病人预约时间
			String PComeHospitalTime = format.format(d1);
			// 只能预约后两天的上午八点到下午五点
			// 获取当前时间
			Date todayDate = new Date();
			// 计算差值，分钟数

			long minutes = (d1.getTime() - todayDate.getTime()) / (1000 * 60);
			System.out.println(minutes);
			// 计算差值，天数
			float hours = (d1.getTime() - todayDate.getTime()) / (1000 * 60 * 60);
			System.out.println("差的分钟数" + minutes);

			String appointHout[] = null;
			appointHout = time1.split(":");
			String currentHour[] = null;

			System.out.println("预约时间小时数" + appointHout[0]);

			if (minutes <= 2 * 72* 60&& minutes > 0) {

				map.put("IsInThree", "true");
				if (Integer.valueOf(appointHout[0]) < 18 && Integer.valueOf(appointHout[0]) > 9) {
					// if(){}else{}

					map.put("ISWork", "true");
					Patienthistory patienthistory = new Patienthistory();
					patienthistory.setPregisteId(
							((User) request.getSession().getAttribute("current_login_user")).getUregisteId());
					patienthistory.setPmoneyType(0);
					patienthistory.setDregisteId(doctorid);
					patienthistory.setPcomeHospitalTime(d1);
					try {
						patienthistoryService.save(patienthistory);
						map.put("IsSuccess", "true");
					} catch (Exception e) {
						// TODO: handle exception
						map.put("IsSuccess", "false");
					}
				} else {
					map.put("ISWork", "false");
				}
				// 插数据

			} else {
				map.put("IsInThree", "false");
			}

		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return map;

	}

	// 预约时获取制定科室的医生信息
	@RequestMapping(value = "ajax/getDoctorList.mvc")
	public @ResponseBody Map<String, Object> getDoctorList(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取当前所查询科室医生信息
		String officeId = request.getParameter("officeId");
		List<Doctor> doctorlist_officeid = new ArrayList<>();
		doctorlist_officeid = doctorService.findByOfficeId(Integer.valueOf(officeId));
		for (int i = 0; i < doctorlist_officeid.size(); i++) {
			System.err.println("====" + doctorlist_officeid.get(i).getEntitler().getDentitleName());
		}

		request.getSession().setAttribute("doctorlist_officeid", doctorlist_officeid);
		return map;

	}

	// 查询病人相关记录
	@RequestMapping(value = "ajax/showInfoAppoint.mvc")
	public @ResponseBody Map<String, Object> showInfoAppoint(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		String doctorid = ((User) request.getSession().getAttribute("current_login_user")).getUregisteId();
		System.out.println("yaochaxungeiyisheng" + doctorid);
		// 只显示今天预约记录
		Date todayDate = new Date();
		try {
			List appointinfolist = patienthistoryService.findAll(doctorid, todayDate);
			request.getSession().setAttribute("appointinfolist", appointinfolist);
			map.put("IsGetAppointInfoSuccess", "true");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("IsGetAppointInfoSuccess", "false");
		}

		return map;

	}

}
