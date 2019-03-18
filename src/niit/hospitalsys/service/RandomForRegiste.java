package niit.hospitalsys.service;

import java.util.Random;

import org.springframework.stereotype.Service;
@Service
public class RandomForRegiste {
	public static final String numberChar="0123456789";
	public static String getRandom() { 
		Long seed = System.currentTimeMillis();// 获得系统时间,作为生成随机数的种子 
		StringBuffer sb = new StringBuffer();// 装载生成的随机数 
		Random random = new Random(seed);// 调用种子生成随机数 
		for (int i = 0; i < 20; i++) { 
		sb.append(numberChar.charAt(random.nextInt(numberChar.length()))); 
		} 
		return sb.toString(); 
		}
}
