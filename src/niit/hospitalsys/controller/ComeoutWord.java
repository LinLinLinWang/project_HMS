package niit.hospitalsys.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
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

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import niit.hospitalsys.entity.Answerquestion;
import niit.hospitalsys.entity.Patienthistory;
import niit.hospitalsys.entity.User;
import niit.hospitalsys.service.CheckFactResultService;
import niit.hospitalsys.service.EachMoneyService;
import niit.hospitalsys.service.PatienthistoryService;
import niit.hospitalsys.service.UserService;
import test.Student;

@Controller
public class ComeoutWord {
	@Resource
	PatienthistoryService patienthistoryService;
	@Resource
	EachMoneyService eachMoneyService;
	@Resource
	CheckFactResultService checkFactResultService;
	@Resource
	UserService userService;

	@RequestMapping(value = "ajax/outPutCountlist.mvc")
	public @ResponseBody Map<String, Object> outPutCountlist(HttpServletRequest request, HttpServletResponse response)
			throws IOException, TemplateException {
		String phid = request.getParameter("hid");
		Patienthistory patienthistory = new Patienthistory();
		patienthistory = patienthistoryService.findByHid(phid);
		// 检查
		String checks[] = patienthistory.getPexamineFacts().split(",");
		List<String[]> countdetail = new ArrayList<>();

		float Totalcount = 0;
		for (int i = 0; i < checks.length; i++) {
			String checkdetaileach1[] = new String[4];
			float eachmony = eachMoneyService.findByMId(Integer.valueOf(checks[i])).getMmoney();
			String name = eachMoneyService.findByMId(Integer.valueOf(checks[i])).getMname();
			String count = "1";
			String toltal = eachmony * 1 + "";
			checkdetaileach1[0] = name;
			checkdetaileach1[1] = eachmony + "";
			checkdetaileach1[2] = count;
			checkdetaileach1[3] = toltal;
			countdetail.add(checkdetaileach1);
			Totalcount = Totalcount + Float.parseFloat(toltal);
			System.err.println("便利检查" + checkdetaileach1[0]);
		}
		for (int l = 0; l < countdetail.size(); l++) {
			System.out.println(countdetail.get(l)[0]);
		}

		// 药

		float medicintTotal = 0;
		try {

			String medcinesname[] = patienthistory.getDmedicines().split(",");
			for (int k = 0; k < medcinesname.length; k++) {
				String checkdetaileach2[] = new String[4];
				String eachmedcine[] = medcinesname[k].split("count");
				float eachmoney = eachMoneyService.findByMId(Integer.valueOf(eachmedcine[0])).getMmoney();
				String eachcount = eachmedcine[1];
				String name = eachMoneyService.findByMId(Integer.valueOf(eachmedcine[0])).getMname();
				String eachmedim = eachmoney * Integer.valueOf(eachcount) + "";
				checkdetaileach2[0] = name;
				checkdetaileach2[1] = eachmoney + "";
				checkdetaileach2[2] = eachcount;
				checkdetaileach2[3] = eachmedim;
				countdetail.add(checkdetaileach2);
				medicintTotal = medicintTotal + Float.parseFloat(eachmedim);
				System.err.println("便利药品" + checkdetaileach2[0]);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		for (int l = 0; l < countdetail.size(); l++) {
			System.out.println(countdetail.get(l)[0]);
		}

		// 其他东西

		float otherthingm = 0;
		try {
			String otherthing[] = patienthistory.getDotherThings().split(",");
			for (int k = 0; k < otherthing.length; k++) {
				String checkdetaileach3[] = new String[4];
				String eachother[] = otherthing[k].split("count");
				if (eachother[0].equals("12")) {

					float eachmoney = eachMoneyService.findByMId(Integer.valueOf(eachother[0])).getMmoney();
					if (patienthistoryService.findByHid(phid).getPhomeHosptial() == null) {
						String eachcount = "未开始住院";

						String name = "住院费";
						String eachmedim = "无法结算";
						checkdetaileach3[0] = name;
						checkdetaileach3[1] = eachmoney + "";
						checkdetaileach3[2] = eachcount;
						checkdetaileach3[3] = eachmedim;
						countdetail.add(checkdetaileach3);
						System.err.println("便利药品" + checkdetaileach3[0]);

					} else {
						if (patienthistoryService.findByHid(phid).getPhomeHosptial() != null
								&& patienthistoryService.findByHid(phid).getPoutHosptial() == null) {
							String eachcount = "您尚在住院";
							String name = "住院费";
							String eachmedim = "无法结算";
							checkdetaileach3[0] = name;
							checkdetaileach3[1] = eachmoney + "";
							checkdetaileach3[2] = eachcount;
							checkdetaileach3[3] = eachmedim;
							countdetail.add(checkdetaileach3);
							System.err.println("便利药品" + checkdetaileach3[0]);

						} else {
							long days = (patienthistoryService.findByHid(phid).getPoutHosptial().getTime()
									- patienthistoryService.findByHid(phid).getPhomeHosptial().getTime())
									/ (1000 * 60 * 60 * 24);
							System.out.println("组胡云天数" + days);
							String eachcount = days + "";
							String name = "住院费";
							String eachmedim = eachmoney * days + "";
							checkdetaileach3[0] = name;
							checkdetaileach3[1] = eachmoney + "";
							checkdetaileach3[2] = eachcount;
							checkdetaileach3[3] = eachmedim;
							countdetail.add(checkdetaileach3);
							otherthingm = otherthingm + Float.parseFloat(eachmedim);
							System.err.println("便利药品" + checkdetaileach3[0]);
						}

					}

				} else {
					float eachmoney = eachMoneyService.findByMId(Integer.valueOf(eachother[0])).getMmoney();
					String eachcount = eachother[1];
					String name = eachMoneyService.findByMId(Integer.valueOf(eachother[0])).getMname();
					String eachmedim = eachmoney * Integer.valueOf(eachcount) + "";
					checkdetaileach3[0] = name;
					checkdetaileach3[1] = eachmoney + "";
					checkdetaileach3[2] = eachcount;
					checkdetaileach3[3] = eachmedim;
					countdetail.add(checkdetaileach3);
					otherthingm = otherthingm + Float.parseFloat(eachmedim);
					System.err.println("便利药品" + checkdetaileach3[0]);
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		for (int l = 0; l < countdetail.size(); l++) {
			System.out.println(countdetail.get(l)[0]);
		}
		System.out.println("此时已经有" + countdetail.size());
		///

		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		int num = t.indexOf(".metadata");
		// String path = t.substring(1, num).replace('/', '\\') +
		// "project_HMS\\webapp\\doc\\"
		// + phid+"countlist" + ".docx";
		String first = t.substring(1, num).replace('/', '\\') + "project_HMS\\webapp\\model\\";

		String totalmoney = Totalcount + medicintTotal + otherthingm + "";
		Map<String, Object> map = new HashMap<String, Object>();
		Configuration configuration = new Configuration();
		/** 设置编码 **/
		configuration.setDefaultEncoding("utf-8");
		/** 我的ftl文件是放在D盘的 **/
		// String fileDirectory = "C:\\Users\\admin\\Desktop\\1\\";
		/** 加载文件 **/
		configuration.setDirectoryForTemplateLoading(new File(first));
		/** 加载模板 **/
		Template template = configuration.getTemplate("count.ftl");
		/** 准备数据 **/
		String username = ((User) request.getSession().getAttribute("current_login_user")).getUname();
		Date date = new Date();
		String time = date.toString();
		/** 表格数据 studentList和freemarker标签要对应 **/
		Map dataMap = new HashMap();
		// Map<String,List<Student>> dataMap2 = new HashMap<>();
		// Map<String, String> dataMap2 = new HashMap<>();
		/** 在ftl文件中有${textDeal}这个标签 **/
		dataMap.put("username", username);
		dataMap.put("total_count", totalmoney);
		dataMap.put("time", time);
		dataMap.put("hid", phid);
		dataMap.put("list", countdetail);
		for (int l = 0; l < countdetail.size(); l++) {
			System.out.println(countdetail.get(l)[0]);
		}
		String outFilePath = "C:\\dede\\" + phid + "countlist.docx";
		File docFile = new File(outFilePath);
		File fileParent = docFile.getParentFile();
		if (!fileParent.exists()) {
			fileParent.mkdirs();
		}
		docFile.createNewFile();

		FileOutputStream fos = new FileOutputStream(docFile);
		Writer out = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"), 10240);
		// template.process(dataMap2,out);
		template.process(dataMap, out);

		if (out != null) {
			out.close();
		}

		return map;
	}

	@RequestMapping(value = "ajax/outPutdetaillist.mvc")
	public @ResponseBody Map<String, Object> outPutdetaillist(HttpServletRequest request, HttpServletResponse response)
			throws IOException, TemplateException {
		String phid = request.getParameter("hid");
		Patienthistory patienthistory = new Patienthistory();
		patienthistory = patienthistoryService.findByHid(phid);
		String medicinename = "未开药";
		try {
			if (null == patienthistory.getDmedicines().split(",")) {
			} else {
				String medcimes[] = patienthistory.getDmedicines().split(",");
				try {
					for (int i = 0; i < medcimes.length; i++) {
						String dd[] = medcimes[i].split("count");
						System.err.println("=====" + dd[0]);
						medicinename = " " + medicinename
								+ eachMoneyService.findByMId(Integer.valueOf(dd[0])).getMname();
					}

				} catch (Exception e) {
					// TODO: handle exception
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		String DexamineResult = "未得出结果";
		try {
			if (null == patienthistory.getDexamineResult()) {
				DexamineResult = "未得出结果";
			} else {
				DexamineResult = patienthistory.getDexamineResult();
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		String medcineuse = "未开药";
		try {
			if (null == patienthistory.getDmedicineUse()) {

			} else {
				medcineuse = patienthistory.getDmedicineUse();
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		String presSu = "无预防建议";
		try {
			if (null == patienthistory.getDpreventSuggestion()) {

			} else {
				presSu = patienthistory.getDpreventSuggestion();
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		String food = "为阐述饮食建议";
		try {
			if(null==patienthistory.getDfoodSuggestion()){
				
			}else{food = patienthistory.getDfoodSuggestion();}
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		String listw[] = new String[6];
		listw[0] = phid;
		listw[1] = DexamineResult;
		listw[2] = medicinename;
		listw[3] = medcineuse;
		listw[4] = presSu;
		listw[5] = food;
		List<String[]> list = new ArrayList<>();
		list.add(listw);
		Map dataMap = new HashMap();
		String username = ((User) request.getSession().getAttribute("current_login_user")).getUname();
		dataMap.put("username", username);
		Date date = new Date();
		dataMap.put("time", date.toString());
		dataMap.put("list", list);

		String t = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		int num = t.indexOf(".metadata");
		String first = t.substring(1, num).replace('/', '\\') + "project_HMS\\webapp\\model\\";

		Map<String, Object> map = new HashMap<String, Object>();
		Configuration configuration = new Configuration();
		/** 设置编码 **/
		configuration.setDefaultEncoding("utf-8");
		/** 我的ftl文件是放在D盘的 **/
		// String fileDirectory = "C:\\Users\\admin\\Desktop\\1\\";
		/** 加载文件 **/
		configuration.setDirectoryForTemplateLoading(new File(first));
		/** 加载模板 **/
		Template template = configuration.getTemplate("his.ftl");
		/** 准备数据 **/

		/** 表格数据 studentList和freemarker标签要对应 **/

		// Map<String,List<Student>> dataMap2 = new HashMap<>();
		// Map<String, String> dataMap2 = new HashMap<>();
		/** 在ftl文件中有${textDeal}这个标签 **/

		String outFilePath = "C:\\dede\\" + phid + "detaillist.docx";
		File docFile = new File(outFilePath);
		File fileParent = docFile.getParentFile();
		if (!fileParent.exists()) {
			fileParent.mkdirs();
		}
		docFile.createNewFile();

		FileOutputStream fos = new FileOutputStream(docFile);
		Writer out = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"), 10240);
		// template.process(dataMap2,out);
		template.process(dataMap, out);

		if (out != null) {
			out.close();
		}

		return null;
	}
}
