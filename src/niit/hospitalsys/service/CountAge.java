package niit.hospitalsys.service;

import java.util.Calendar;

import org.springframework.stereotype.Service;
@Service
public class CountAge {
      public String countAge(String uid){
    	  String birthyear=uid.substring(6,10);
    	  //出生年份
    	  System.out.println("出生年份"+birthyear);
    	  //获取当前年份
    	  Calendar date = Calendar.getInstance();
          String currentyear = String.valueOf(date.get(Calendar.YEAR));
          int age=Integer.valueOf(currentyear)-Integer.valueOf(birthyear);
          String age_String=age+"";
          //当前年龄
          System.out.println("当前年龄"+age_String);
          
    	  return age_String;
    	  
    	  
    	  
    	  
      }
}
