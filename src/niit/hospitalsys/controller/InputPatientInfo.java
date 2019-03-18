package niit.hospitalsys.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import niit.hospitalsys.entity.Bloodhistory;
import niit.hospitalsys.entity.Blooduser;
import niit.hospitalsys.entity.Checkfactresult;
import niit.hospitalsys.entity.CheckfactresultId;
import niit.hospitalsys.entity.ChooseSeePCheck;
import niit.hospitalsys.entity.EachPhidCheck;
import niit.hospitalsys.entity.Eachmoney;
import niit.hospitalsys.entity.Entitler;
import niit.hospitalsys.entity.Office;
import niit.hospitalsys.entity.Patienthistory;
import niit.hospitalsys.entity.User;
import niit.hospitalsys.service.BloodService;
import niit.hospitalsys.service.CheckFactResultService;
import niit.hospitalsys.service.EachMoneyService;
import niit.hospitalsys.service.PatienthistoryService;
import niit.hospitalsys.service.UserService;

@Controller
public class InputPatientInfo {
	static String count_cancle;
	@Resource
	PatienthistoryService patienthistoryService;
	@Resource
	EachMoneyService eachMoneyService;
	@Resource
	CheckFactResultService checkFactResultService;
	@Resource
	UserService userService;
	@Resource
	BloodService bloodService;

	// 
	@RequestMapping(value = "ajax/updateillness.mvc")
	public @ResponseBody Map<String, Object> showInfoAppoint(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String hid = request.getParameter("hid");
		System.out.println("hid" + hid);
		String illnessDetail = request.getParameter("illness");
		System.out.println(illnessDetail);
		Patienthistory patienthistory = new Patienthistory();

		
			patienthistory = patienthistoryService.findByHid(hid);
			patienthistory.setPillnessDetails(illnessDetail);
			//patienthistory.setPmoneyType(0);
			patienthistoryService.updatePation(patienthistory);
			System.err.println("====================");
		return map;

	}

	//
	@RequestMapping(value = "ajax/getEachThing.mvc")
	public @ResponseBody Map<String, Object> showInfoTeachhing(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Eachmoney> everthingzlist = eachMoneyService.findAll();
			request.getSession().setAttribute("everthingzlist", everthingzlist);
			map.put("GetEveryThingListIsSuccess", "true");

		} catch (Exception e) {
			// TODO: handle exception
			map.put("GetEveryThingListIsSuccess", "false");

		}

		return map;

	}


	@RequestMapping(value = "ajax/CheckOrMedicine.mvc")
	public @ResponseBody Map<String, Object> checkOrMedicine(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String hid = request.getParameter("hid");
		String inserttype = request.getParameter("type");
		String mid = request.getParameter("mid");
		String IsCnacle = request.getParameter("IsCnacle");

	
		if (inserttype.equals("0")) {

			if (IsCnacle.equals("false")) {
				Patienthistory patienthistory = patienthistoryService.findByHid(hid);
				if (null == patienthistory.getPexamineFacts()) {
					patienthistory.setPexamineFacts(mid + ",");
					patienthistoryService.updatePation(patienthistory);

				} else {
					patienthistory.setPexamineFacts(patienthistory.getPexamineFacts() + mid + ",");
					patienthistoryService.updatePation(patienthistory);
				}

			} else {
				Patienthistory patienthistory = patienthistoryService.findByHid(hid);
				String beforeCancle = patienthistory.getPexamineFacts();
				String test[] = beforeCancle.split(",");
				String afterCancle = "";

				for (int i = 0; i < test.length; i++) {
					if (test[i].equals(mid)) {
						test[i] = "";
						afterCancle = afterCancle + test[i];
					} else {
						afterCancle = afterCancle + test[i] + ",";
					}

				}

				System.out.println(" " + afterCancle);
				// test
				String test1[] = afterCancle.split(",");
				for (String string : test1) {
					System.out.println("" + string + "");
				}
				System.out.println("" + test1.length);
				patienthistory.setPexamineFacts(afterCancle);
				patienthistoryService.updatePation(patienthistory);
			

			}
		} else {
			
			if (inserttype.equals("2")) {
				String namecount = request.getParameter("namecount");
				String count = request.getParameter("count");

				System.out.println("" + namecount);
				if (IsCnacle.equals("false")) {
					Patienthistory patienthistory = patienthistoryService.findByHid(hid);
					if (null == patienthistory.getDmedicines()) {
						patienthistory.setDmedicines((namecount + ","));
						patienthistoryService.updatePation(patienthistory);
					
						String beforecount = eachMoneyService.findByMId(Integer.valueOf(mid)).getMcount();
						Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(mid));

						eachmoney.setMcount((Integer.valueOf(beforecount) - Integer.valueOf(count)) + "");
						eachMoneyService.update(eachmoney);
						System.out.println("wc");
					} else {
						patienthistory.setDmedicines(patienthistory.getDmedicines() + namecount + ",");
						patienthistoryService.updatePation(patienthistory);
					
						String beforecount = eachMoneyService.findByMId(Integer.valueOf(mid)).getMcount();
						Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(mid));
						System.out.println("" + count);
						eachmoney.setMcount((Integer.valueOf(beforecount) - Integer.valueOf(count)) + "");
						eachMoneyService.update(eachmoney);

					}

				} else {

					Patienthistory patienthistory = patienthistoryService.findByHid(hid);
					String beforeCancle = patienthistory.getDmedicines();
					String test[] = beforeCancle.split(",");
					String afterCancle = "";
					String cancleCount = "";
					for (int i = 0; i < test.length; i++) {
						String test1[] = test[i].split("count");
						if (test1[0].equals(mid)) {
							test[i] = "";
							cancleCount = test1[1];
							afterCancle = afterCancle + test[i];
						} else {
							afterCancle = afterCancle + test[i] + ",";
						}

					}

					System.out.println(afterCancle);
					patienthistory.setDmedicines(afterCancle);
					patienthistoryService.updatePation(patienthistory);
					
					String beforecount = eachMoneyService.findByMId(Integer.valueOf(mid)).getMcount();
					Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(mid));
					System.out.println("=====" + Integer.valueOf(count_cancle) + "=====");
					eachmoney.setMcount((Integer.valueOf(beforecount) + Integer.valueOf(cancleCount)) + "");
					eachMoneyService.update(eachmoney);

				

				}

			} else {
			
				String namecount = request.getParameter("namecount");
				String count = request.getParameter("count");

				if (null == count) {

				} else {
					count_cancle = count;
				}
				System.out.println("鍏朵粬鎯宠" + namecount);
				if (IsCnacle.equals("false")) {

					Patienthistory patienthistory = patienthistoryService.findByHid(hid);
					if (null == patienthistory.getDotherThings()) {
						patienthistory.setDotherThings(namecount + ",");
						patienthistoryService.updatePation(patienthistory);
					
						String beforecount = eachMoneyService.findByMId(Integer.valueOf(mid)).getMcount();
						Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(mid));

						eachmoney.setMcount((Integer.valueOf(beforecount) - Integer.valueOf(count)) + "");
						eachMoneyService.update(eachmoney);
						System.out.println("wc");

					} else {
						patienthistory.setDotherThings(patienthistory.getDotherThings() + namecount + ",");
						patienthistoryService.updatePation(patienthistory);
					
						String beforecount = eachMoneyService.findByMId(Integer.valueOf(mid)).getMcount();
						Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(mid));

						eachmoney.setMcount((Integer.valueOf(beforecount) - Integer.valueOf(count)) + "");
						eachMoneyService.update(eachmoney);
						System.out.println("wc");
					}

				} else {

					Patienthistory patienthistory = patienthistoryService.findByHid(hid);
					String beforeCancle = patienthistory.getDotherThings();
					String test[] = beforeCancle.split(",");

					String afterCancle = "";
					String cancleCount = "";
					for (int i = 0; i < test.length; i++) {
						String test1[] = test[i].split("count");
						if (test1[0].equals(mid)) {
							test[i] = "";
							cancleCount = test1[1];
							afterCancle = afterCancle + test[i];
						} else {
							afterCancle = afterCancle + test[i] + ",";
						}

					}

					patienthistory.setDotherThings(afterCancle);
					patienthistoryService.updatePation(patienthistory);
					
					String beforecount = eachMoneyService.findByMId(Integer.valueOf(mid)).getMcount();
					Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(mid));
					System.out.println("=====" + Integer.valueOf(count_cancle) + "=====");
					eachmoney.setMcount((Integer.valueOf(beforecount) + Integer.valueOf(cancleCount)) + "");
					eachMoneyService.update(eachmoney);

				}

			}

		}

		return map;

	}


	@RequestMapping(value = "ajax/getMedicine.mvc")
	public @ResponseBody Map<String, Object> getMedicine(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String hid = request.getParameter("hid");
		String medicines = patienthistoryService.findByHid(hid).getDmedicines();
		System.out.println("开的药" + medicines);
		try {
			String medicineslist[] = medicines.split(",");
			Map<String, String> mapList = new HashMap<String, String>();
			
			for (int i = 0; i < medicineslist.length; i++) {
				String onemedicine[] = medicineslist[i].split("count");

				mapList.put(onemedicine[0], onemedicine[1]);
			}
		
			List<Eachmoney> list = new ArrayList<>();
			for (String key : mapList.keySet()) {
				list.add(eachMoneyService.findByMId(Integer.valueOf(key)));
				System.out.println(key);
			}
			request.getSession().setAttribute("NeedMedicine", list);
		} catch (Exception e) {
			// TODO: handle exception
		 if(null==medicines||null==medicines.split(",")){
			 System.out.println("没有安排药");
				
				
		 }else{String medicineslist[] = medicines.split(",");
			Map<String, String> mapList = new HashMap<String, String>();
			
			for (int i = 0; i < medicineslist.length; i++) {
				String onemedicine[] = medicineslist[i].split("count");

				mapList.put(onemedicine[0], onemedicine[1]);
			}
		
			List<Eachmoney> list = new ArrayList<>();
			for (String key : mapList.keySet()) {
				list.add(eachMoneyService.findByMId(Integer.valueOf(key)));
				System.out.println(key);
			}
			request.getSession().setAttribute("NeedMedicine", list);
		}}	
			
			
	
		return map;

	}


	@RequestMapping(value = "ajax/medicineUse.mvc")
	public @ResponseBody Map<String, Object> medicineUse(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		String medicineuse = request.getParameter("medicine");
		String hid = request.getParameter("hid");
		System.out.println("hidhidhid" + hid);
		Patienthistory patienthistory = patienthistoryService.findByHid(hid);
		patienthistory.setDmedicineUse(medicineuse);
		patienthistoryService.updatePation(patienthistory);
		return map;

	}


	@RequestMapping(value = "ajax/needmoney.mvc")
	public @ResponseBody Map<String, Object> needmoney(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String registeid = ((User) request.getSession().getAttribute("current_login_user")).getUregisteId();
		List<Patienthistory> needmoneyList = patienthistoryService.findByTypeAndResgite(0, registeid);
		request.getSession().setAttribute("zhifu", needmoneyList);
		System.err.println("======="+needmoneyList.size());
		List<List<Eachmoney>> totallist = new ArrayList<>();
		for (int i = 0; i < needmoneyList.size(); i++) {
			List<Eachmoney> list = new ArrayList<>();
			System.out.println(needmoneyList.size());
			String needchek = needmoneyList.get(i).getPexamineFacts();
			
			String eachCheck[] = needchek.split(",");

			String eachdetail[];
			for (String string : eachCheck) {
				System.err.println(string);
			}

			for (int k = 0; k < eachCheck.length; k++) {
				System.err.println("==s====" + eachCheck.length);
				Eachmoney check = eachMoneyService.findByMId(Integer.valueOf(eachCheck[k]));
				list.add(check);
				System.err.println("55" + "ddd" + list.size());
			}
			System.err.println("" + i + "" + list.size());
			totallist.add(list);

		}
		request.getSession().setAttribute("needmoneyList", totallist);
		for (int i = 0; i < totallist.size(); i++) {
			System.err.println("" + totallist.get(i).size());
			for (int k = 0; k < totallist.get(i).size(); k++) {
				System.out.println("" + i + "" + k + "" + totallist.get(i).get(k).getMid());

			}
		}

		return map;

	}


	@RequestMapping(value = "ajax/moneytype.mvc")
	public @ResponseBody Map<String, Object> moneytype(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();

		String hid = request.getParameter("hid");
		System.out.println("====ss====ssshuge" + hid);
		String type = request.getParameter("type");
		Patienthistory patienthistory = patienthistoryService.findByHid(hid);
		patienthistory.setPmoneyType(Integer.valueOf(type));
		patienthistoryService.updatePation(patienthistory);
		return map;

	}

	@RequestMapping(value = "ajax/inputCheckResoult.mvc")
	public @ResponseBody Map<String, Object> inputCheckResoult(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		String contorltype = request.getParameter("type");

		if ("complete".equals(contorltype)) {
			String phid = request.getParameter("hid");
			Patienthistory patienthistory = patienthistoryService.findByHid(phid);
			String needcheck = patienthistory.getPexamineFacts();
			String needcheckre[] = needcheck.split(",");
			List<Eachmoney> list = new ArrayList<>();
			for (int i = 0; i < needcheckre.length; i++) {
				Eachmoney eachmoney = eachMoneyService.findByMId(Integer.valueOf(needcheckre[i]));
				list.add(eachmoney);
			}
			request.getSession().setAttribute("needcheckandgivenmonry", list);
		} else {
			if ("inputcheckre".equals(contorltype)) {
			
				String hid = request.getParameter("hid");
				String checkresults = request.getParameter("data");
				System.out.println("" + checkresults);
				String checkresultseach[] = checkresults.split(",");

				for (int i = 0; i < checkresultseach.length; i++) {

					String diffmidandresult[] = checkresultseach[i].split(":");
					System.out.println(checkresultseach[i]);
					System.err.println(diffmidandresult.length);
					CheckfactresultId checkfactresultId = new CheckfactresultId();
					checkfactresultId.setPhid(Integer.valueOf(hid));
					checkfactresultId.setPexamineFact(diffmidandresult[0]);
					Checkfactresult checkfactresult = new Checkfactresult();
					checkfactresult.setId(checkfactresultId);
					Patienthistory patienthistory = patienthistoryService.findByHid(hid);
					checkfactresult.setPatienthistory(patienthistory);
					checkfactresult.setPexamineSingleResult(diffmidandresult[1]);
					Date pshowResultTime = new Date();
					checkfactresult.setPshowResultTime(pshowResultTime);
					checkFactResultService.save(checkfactresult);

				}

			} else {

				int type = ((User) request.getSession().getAttribute("current_login_user")).getUtype();
				if (type == 2) {
					map.put("IsBoss", "yes");
					List<Patienthistory> list = patienthistoryService.findByType(1);
				
					List<Patienthistory> list3 = new ArrayList<Patienthistory>();
					for (int i = 0; i < list.size(); i++) {
						int phid = list.get(i).getPhid();
						List<Checkfactresult> list2 = checkFactResultService.findByHid(phid);
						Patienthistory patienthistory = patienthistoryService.findByHid(phid + "");
						if (list2.size() == 0) {
							list3.add(patienthistory);

						} else {

						}
					}
					System.out.println("宸蹭氦璐瑰皻鏈鏌ョ殑" + list3.size());
					request.getSession().setAttribute("GivenMoneyButNotCheck", list3);
				} else {
					map.put("IsBoss", "no");
				}
			}

		}

		return map;

	}

	@RequestMapping(value = "ajax/showallpationgivemoney.mvc")
	public @ResponseBody Map<String, Object> showallpationgivemoney(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Patienthistory> list = patienthistoryService.findByType(1);
		List<ChooseSeePCheck> list1 = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {

			if (checkFactResultService.findByHid(Integer.valueOf(list.get(i).getPhid())).size() != 0) {

				ChooseSeePCheck chooseSeePCheck = new ChooseSeePCheck();
				chooseSeePCheck.setGender(((User) userService.findById(list.get(i).getPregisteId())).getUgender());
				chooseSeePCheck.setName(((User) userService.findById(list.get(i).getPregisteId())).getUname());

				chooseSeePCheck.setUid(((User) userService.findById(list.get(i).getPregisteId())).getUid());
				chooseSeePCheck.setOutresult(
						checkFactResultService.findByHid(list.get(i).getPhid()).get(0).getPshowResultTime());
				chooseSeePCheck.setHid(list.get(i).getPhid());
				list1.add(chooseSeePCheck);
			} else {

			}

		}
		System.err.println(list1.size() + "");
		request.getSession().setAttribute("showallpationgivemoney", list1);
		
		return map;

	}


	@RequestMapping(value = "ajax/showhidcheck.mvc")
	public @ResponseBody Map<String, Object> showhidcheck(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Checkfactresult> list = new ArrayList<>();
		List<EachPhidCheck> list2 = new ArrayList<>();
		String hid = request.getParameter("hid");
		list = checkFactResultService.findByHid(Integer.valueOf(hid));

	
		Patienthistory patienthistory = new Patienthistory();
		String result = patienthistoryService.findByHid(hid).getDexamineResult();
		if (null == result || result.equals("")) {
			System.err.println("");
			map.put("isFiinsh", "no");
		} else {
			System.out.println("");
			map.put("isFiinsh", "yes");
		}

		for (int i = 0; i < list.size(); i++) {
			EachPhidCheck eachPhidCheck = new EachPhidCheck();
			eachPhidCheck.setCheckname(
					eachMoneyService.findByMId(Integer.valueOf(list.get(i).getId().getPexamineFact())).getMname());
			eachPhidCheck.setResult(list.get(i).getPexamineSingleResult());
			eachPhidCheck.setTime(list.get(i).getPshowResultTime());
			list2.add(eachPhidCheck);
		}
		request.getSession().setAttribute("showhidcheckbyhid", list2);
		return map;

	}

	@RequestMapping(value = "ajax/complete.mvc")
	public @ResponseBody Map<String, Object> complete(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();
		String hid = request.getParameter("hid");
		System.out.println(hid);
		String finalresult = request.getParameter("finalresult");
		System.out.println(finalresult);
		String foodSuggestion = request.getParameter("foodSuggestion");
		System.out.println(foodSuggestion);
		String needhos = request.getParameter("needh");
		System.out.println(needhos);
		String prentSuggestion = request.getParameter("prentSuggestion");
		System.out.println(prentSuggestion);
		Patienthistory patienthistory = patienthistoryService.findByHid(hid);
		patienthistory.setDexamineResult(finalresult);
		patienthistory.setDfoodSuggestion(foodSuggestion);
		patienthistory.setDpreventSuggestion(prentSuggestion);
		if ("0".equals(needhos)) {

		} else {
			patienthistory.setPtype(1);

		}

		patienthistoryService.updatePation(patienthistory);
		return map;

	}


	@RequestMapping(value = "ajax/choosehomehospital.mvc")
	public @ResponseBody Map<String, Object> choosehomehospital(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		String hid = request.getParameter("hid");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String toltaltime = date + " " + time + ":00";
		System.out.println("总时间" + toltaltime);
	
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d1;
		d1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(toltaltime);
		Date date22 = new Date();
		long days = (d1.getTime() - date22.getTime()) / (1000 * 60 * 60);
		if (-1 <days && days <= 72) {
			Patienthistory patienthistory = patienthistoryService.findByHid(hid);
			patienthistory.setPhomeHosptial(d1);
			patienthistoryService.updatePation(patienthistory);
			map.put("isOk", "yes");

		} else {
			map.put("isOk", "no");

		}
		return map;

	}


	@RequestMapping(value = "ajax/showallhomposital.mvc")
	public @ResponseBody Map<String, Object> showallhomposital(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		List<Patienthistory> list = patienthistoryService.findByHompitaltime();
		List<String[]> list2 = new ArrayList<>();
		String ddd[] = new String[5];
		for (int i = 0; i < list.size(); i++) {
			String uname = userService.findById(list.get(0).getPregisteId()).getUname();
			String uid = userService.findById(list.get(0).getPregisteId()).getUid();
			String registe = userService.findById(list.get(0).getPregisteId()).getUregisteId();
			String pid = list.get(i).getPhid() + "";
			String homposital = list.get(i).getPcomeHospitalTime().toString();
			ddd[0] = pid;
			ddd[1] = uid;
			ddd[2] = registe;
			ddd[3] = uname;
			ddd[4] = homposital;
			list2.add(ddd);

		}
		request.getSession().setAttribute("ddd", list2);

		return map;

	}



	@RequestMapping(value = "ajax/outhospital.mvc")
	public @ResponseBody Map<String, Object> outhospital(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		Date da = new Date();
		String phid = request.getParameter("hid");
		Patienthistory patienthistory = patienthistoryService.findByHid(phid);
		patienthistory.setPoutHosptial(da);
		patienthistoryService.updatePation(patienthistory);

		return map;

	}

	@RequestMapping(value = "ajax/showcountlist.mvc")
	public @ResponseBody Map<String, Object> showcountlist(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		String registeid = ((User) request.getSession().getAttribute("current_login_user")).getUregisteId();
		List<Patienthistory> list = patienthistoryService.findByResgite(registeid);
		List<String[]> list2 = new ArrayList<>();

		for (int i = 0; i < list.size(); i++) {
			String everyhid[] = new String[5];
			String hid = list.get(i).getPhid() + "";
			String appointtime = list.get(i).getPcomeHospitalTime().toString();
			String type = list.get(i).getPtype() + "";
			String counttype = "";
			if (type.equals("0")) {
				counttype = "各项费用均未缴纳";
			}
			if (type.equals("1")) {
				counttype = "各项检查费用已经缴纳";
			}
			if (type.equals("2")) {
				counttype = "已经全部缴纳";
			}
			String ptype = list.get(i).getPtype() + "";
			String petype = "";
			if (ptype.equals("0")) {
				petype = "门诊病人";
			} else {
				petype = "住院";
			}
			// 缁熻妫�鏌ラ挶
			float tolcheckcount = 0;
			try {
				String check[] = list.get(i).getPexamineFacts().split(",");
				for (int l = 0; l < check.length; l++) {

					float singlemoney = eachMoneyService.findByMId(Integer.valueOf(check[l])).getMmoney();
					tolcheckcount = singlemoney + tolcheckcount;
				}

			} catch (Exception e) {
				// TODO: handle exception
			}

			System.out.println("" + tolcheckcount);
		
			float totalmedicinecout = 0;
			try {
				String medicine[] = list.get(i).getDmedicines().split(",");
				for (int l = 0; l < medicine.length; l++) {
					String medicineSinglecount[] = medicine[l].split("count");

					float singlemoney = eachMoneyService.findByMId(Integer.valueOf(medicineSinglecount[0])).getMmoney()
							* Integer.valueOf(medicineSinglecount[1]);

					totalmedicinecout = singlemoney + totalmedicinecout;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}

			System.out.println("鑽�" + totalmedicinecout);
		
			float otherthingcount = 0;
			try {
				String otherthing[] = list.get(i).getDmedicines().split(",");
				for (int l = 0; l < otherthing.length; l++) {
					String otherthingSinglecount[] = otherthing[l].split("count");

					float singlemoney = eachMoneyService.findByMId(Integer.valueOf(otherthingSinglecount[0]))
							.getMmoney() * Integer.valueOf(otherthingSinglecount[1]);

					otherthingcount = singlemoney + otherthingcount;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}

			System.out.println("" + otherthingcount);
		
			float totalhome = 0;
			try {
				if (null == list.get(i).getPhomeHosptial()) {
					System.out.println("");
					totalhome = 0;
				} else {
					if (null != list.get(i).getPoutHosptial()) {
						System.out.println("");
						long days = (list.get(i).getPoutHosptial().getTime() - list.get(i).getPhomeHosptial().getTime())
								/ (1000 * 60 * 60 * 24);
						float singday = eachMoneyService.findByMId(12).getMmoney();
						totalhome = singday * days;
					} else {

						System.out.println("");
						petype = "还在住院中";
						totalhome = 0;
					}
				}

			} catch (Exception e) {
				// TODO: handle exception
			}

			System.out.println("" + totalhome);
			String everymoney = tolcheckcount + totalmedicinecout + otherthingcount + totalhome + "";
			everyhid[0] = hid;
			everyhid[1] = appointtime;
			everyhid[2] = counttype;
			everyhid[3] = petype;
			everyhid[4] = everymoney;

			list2.add(everyhid);
		}
		request.getSession().setAttribute("list_count", list2);
		return map;

	}


	@RequestMapping(value = "ajax/inputBlood.mvc")
	public @ResponseBody Map<String, Object> inputBlood(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		String number = request.getParameter("number");
		String bllod = request.getParameter("blood");
		String type = request.getParameter("type");
		System.out.println(number + bllod + type);
		if (0 == userService.findByNumber(number).size()) {
			map.put("isP", "no");
		} else {
			String registe = userService.findByNumber(number).get(0).getUregisteId();
			Blooduser blooduser = new Blooduser();
			if(bloodService.findbyRegisteID(registe)==null){
				blooduser.setBloodType(type);
			    blooduser.setDregisteId(registe);
				blooduser.setUser(userService.findByNumber(number).get(0));
				bloodService.save(blooduser);
				
			}else{
				
				System.out.println("两次确定血型 不通过");
			}
		
			Bloodhistory bloodhistory = new Bloodhistory();
			bloodhistory.setBloodScale(Integer.valueOf(bllod));
			bloodhistory.setDregisteId(registe);
			Date time = new Date();
			bloodhistory.setTime(time);
			bloodService.savehis(bloodhistory);
			map.put("isP", "yes");
		}
		return map;

	}

	@RequestMapping(value = "ajax/getMedicineInfo.mvc")
	public @ResponseBody Map<String, Object> getMedicineInfo(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		List<Eachmoney> medicineList = new ArrayList<>();
		medicineList = eachMoneyService.findBytype(2);
		if (((User) request.getSession().getAttribute("current_login_user")).getUtype() == 2) {
			map.put("isBoos", "yes");
		} else {
			map.put("isBoos", "no");
		}
	
		request.getSession().setAttribute("medicineList", medicineList);
		return map;

	}


	@RequestMapping(value = "ajax/showbloodhistory.mvc")
	public @ResponseBody Map<String, Object> showbloodhistory(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		List<Bloodhistory> list = bloodService.findAll();
		if (((User) request.getSession().getAttribute("current_login_user")).getUtype() == 2) {
			map.put("isBoss", "yes");

			int total[] = new int[4];
			total[0] = 0;// A
			total[1] = 0;// b
			total[2] = 0;// ab
			total[3] = 0;// O

			for (int i = 0; i < list.size(); i++) {
				try {
					if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("A")) {
						
						int scale = list.get(i).getBloodScale();
						total[0] = total[0] + scale;

					}
					if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("B")) {
					
						int scale = list.get(i).getBloodScale();
						total[1] = total[1] + scale;

					}
					if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("AB")) {
					
						int scale = list.get(i).getBloodScale();
						total[2] = total[2] + scale;

					}
					if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("O")) {
					
						int scale = list.get(i).getBloodScale();
						total[3] = total[3] + scale;

					}
				} catch (Exception e) {
					// TODO: handle exception
				}

			}

			request.getSession().setAttribute("bood", total); // 鏄剧ず鎬昏閲�
			System.out.println("A" + total[0] + "B" + total[1] + "AB" + total[2] + "O" + total[3]);

		} else {
			map.put("isBoss", "no");
		}
		return map;

	}
	// 鏄剧ず鍘嗗彶鐢ㄨ閲�

	@RequestMapping(value = "ajax/showbloodhistorylist.mvc")
		public @ResponseBody Map<String, Object> showbloodhistorylist(HttpServletRequest request, HttpServletResponse response)
				throws IOException, ParseException {
		
			Map<String, Object> map = new HashMap<String, Object>();
			List<Bloodhistory> list=bloodService.findAll();
			System.err.println("============="+list.size());
			List<String []>listh=new ArrayList<>();
		 // 
		  
		   for(int i=0;i<list.size();i++){
			   System.out.println(i);
			   System.err.println("进入循环"+list.size());
			   String eachlist[]=new String[6];
			   System.err.println("当前对象"+eachlist);
			   String registe=list.get(i).getDregisteId();
			   if(null==bloodService.findbyRegisteID(registe)){
				
				   eachlist[0]=registe;
				   eachlist[1]="未能查出";
				   if(list.get(i).getBloodScale()<0){
					   eachlist[2]="用血";
					   eachlist[3]="类型未知";
					   eachlist[4] =""+(list.get(i).getBloodScale()-2*list.get(i).getBloodScale());
					   Date time =new Date();
					   eachlist[5]=time.toString();
				   }else{
					   eachlist[2]="献血";
					   eachlist[3]="类型未知";
					   System.out.println("血型"+eachlist[3]);
					   Date time =new Date();
					   eachlist[4]=list.get(i).getBloodScale().toString();
					   eachlist[5]=time.toString();
				   }
				  
				   
			   }else{
				 
				   
				   eachlist[0]=registe;
				   eachlist[1]=userService.findById(registe).getUname();
				   if(list.get(i).getBloodScale()<0){
					   eachlist[2]="用血";
					   eachlist[3] =bloodService.findbyRegisteID(registe).getBloodType();
					   System.out.println("血型"+eachlist[3]);
					   Date time =new Date();
					  
					   eachlist[4] =""+(list.get(i).getBloodScale()-2*list.get(i).getBloodScale());
					   eachlist[5]=time.toString();
				   }else{
					   eachlist[2]="献血";
					   Date time =new Date();
					   eachlist[3]=bloodService.findbyRegisteID(registe).getBloodType();
					   System.out.println("血型"+eachlist[3]);
					   eachlist[4] =list.get(i).getBloodScale()+"";
					   eachlist[5]=time.toString();
				   }
				   
			   }
			   
			   listh.add(eachlist);
			   
		   }
		   request.getSession().setAttribute("showbloodhistorylist", listh);
			
			return map;

		}
	// 娑堣垂琛�

	@RequestMapping(value = "ajax/buyblood.mvc")
	public @ResponseBody Map<String, Object> buyblood(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {

		Map<String, Object> map = new HashMap<String, Object>();

		String id = request.getParameter("registe");

		if (id.length() < 16) {
		
			List<User> userList = new ArrayList<>();
			userList = userService.findByNumber(id);
			if (userList.size() != 0) {
				map.put("havathis", "yes");

				String type = request.getParameter("type");

				String bllod = request.getParameter("bllod");
				Bloodhistory bloodhistory = new Bloodhistory();
				int bllod1 = Integer.valueOf(bllod);
				bloodhistory.setDregisteId(userService.findByNumber(id).get(0).getUregisteId());
				bloodhistory.setBloodScale(bllod1);
				Date time = new Date();
				bloodhistory.setTime(time);
				bloodService.savehis(bloodhistory);
				List<Bloodhistory> list = bloodService.findAll();
				Blooduser blooduser = new Blooduser();
				blooduser.setBloodType(type);
				// blooduser.setDregisteId(userService.findByNumber(id).get(0).getUregisteId());
				blooduser.setUser(userService.findByNumber(id).get(0));
				if(bloodService.findbyRegisteID(userService.findByNumber(id).get(0).getUregisteId())==null){
					bloodService.save(blooduser);
				}else{System.out.println("=========1=-=");}
				
				int total[] = new int[4];
				total[0] = 0;// A
				total[1] = 0;// b
				total[2] = 0;// ab
				total[3] = 0;// O

				for (int i = 0; i < list.size(); i++) {
					try {
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("A")) {
						
							int scale = list.get(i).getBloodScale();
							total[0] = total[0] + scale;

						}
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("B")) {
						
							int scale = list.get(i).getBloodScale();
							total[1] = total[1] + scale;

						}
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("AB")) {
						
							int scale = list.get(i).getBloodScale();
							total[2] = total[1] + scale;

						}
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("O")) {
							
							int scale = list.get(i).getBloodScale();
							total[3] = total[1] + scale;

						}

					} catch (Exception e) {
						// TODO: handle exception
					}

				}

				request.getSession().setAttribute("bood", total); 
				System.out.println("A" + total[0] + "B" + total[1] + "AB" + total[2] + "O" + total[3]);

			} else {
			
				map.put("havathis", "no");

			}

		} else {

		
			User user = new User();

			user = userService.findById(id);
			if (null != user) {
				map.put("havathis", "yes");

				String type = request.getParameter("type");

				String bllod = request.getParameter("bllod");
				int typeint = Integer.valueOf(bllod);
				Bloodhistory bloodhistory = new Bloodhistory();
				bloodhistory.setDregisteId(id);
				bloodhistory.setBloodScale(typeint);
				Date time = new Date();
				bloodhistory.setTime(time);
				bloodService.savehis(bloodhistory);
				List<Bloodhistory> list = bloodService.findAll();
				Blooduser blooduser = new Blooduser();

				blooduser.setBloodType(type);
				
				blooduser.setUser(user);
				if(bloodService.findbyRegisteID(id)==null){
					bloodService.save(blooduser);
				}else{
					
					System.out.println("两次确定血型 不通过");
				}
				
				int total[] = new int[4];
				total[0] = 0;// A
				total[1] = 0;// b
				total[2] = 0;// ab
				total[3] = 0;// O

				for (int i = 0; i < list.size(); i++) {
					try {
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("A")) {
						
							int scale = list.get(i).getBloodScale();
							total[0] = total[0] + scale;

						}
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("B")) {
							
							int scale = list.get(i).getBloodScale();
							total[1] = total[1] + scale;

						}
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("AB")) {
						
							int scale = list.get(i).getBloodScale();
							total[2] = total[1] + scale;

						}
						if (bloodService.findbyRegisteID(list.get(i).getDregisteId()).getBloodType().equals("O")) {
						
							int scale = list.get(i).getBloodScale();
							total[3] = total[1] + scale;

						}
					} catch (Exception e) {
						// TODO: handle exception
					}

				}

				request.getSession().setAttribute("bood", total); 
				System.out.println("A" + total[0] + "B" + total[1] + "AB" + total[2] + "O" + total[3]);

			} else {
				map.put("havathis", "no");

			}
		}

		return map;

	}
			@RequestMapping(value = "ajax/addmicine.mvc")
			public @ResponseBody Map<String, Object> addmicine(HttpServletRequest request, HttpServletResponse response)
					throws IOException, ParseException {

				Map<String, Object> map = new HashMap<String, Object>();
				
			     String mid=request.getParameter("mid");
				String name=request.getParameter("name");
				String money=request.getParameter("mmoney");
				String count =request.getParameter("count");
				
				if(null==eachMoneyService.findByMId(Integer.valueOf(mid))){
					
					map.put("ISExcist", "no");
					Eachmoney eachmoney=new Eachmoney();
					eachmoney.setMid(Integer.valueOf(mid));
					eachmoney.setMcount(count);
					eachmoney.setMtype(2);
					eachmoney.setMmoney(Float.parseFloat(money));
					eachmoney.setMname(name);
				
					
					eachMoneyService.save(eachmoney);
					List<Eachmoney> medicineList = new ArrayList<>();
					
					medicineList = eachMoneyService.findBytype(2);
					request.getSession().setAttribute("medicineList", medicineList);
					
					
				}else{
					map.put("ISExcist", "yes");
					
				}
				
				
				
							return map;

			}
			
}
