package niit.hospitalsys.service;

import java.security.MessageDigest;


import org.springframework.stereotype.Service;
@Service
public class MD5 {

	 // MD5加码32位    
	 public static String MD5(String inStr) {    
	  MessageDigest md5 = null;    
	  try {    
	   md5 = MessageDigest.getInstance("MD5");    
	  } catch (Exception e) {    
	   System.out.println(e.toString());    
	   e.printStackTrace();    
	   return "";    
	  }    
	  char[] charArray = inStr.toCharArray();    
	  byte[] byteArray = new byte[charArray.length];    
	    
	  for (int i = 0; i < charArray.length; i++)    
	   byteArray[i] = (byte) charArray[i];    
	    
	  byte[] md5Bytes = md5.digest(byteArray);    
	    
	  StringBuffer hexValue = new StringBuffer();    
	    
	  for (int i = 0; i < md5Bytes.length; i++) {    
	   int val = (md5Bytes[i]) & 0xff;    
	   if (val < 16)    
	    hexValue.append("0");    
	   hexValue.append(Integer.toHexString(val));    
	  }    
	    
	  return hexValue.toString();    
	 }    
 
	    
	 // 加密后解密     返回不了原先数据
	 public static String JM(String inStr) {    
	  char[] a = inStr.toCharArray();    
	  for (int i = 0; i < a.length; i++) {    
	   a[i] = (char) (a[i] ^ 't');    
	  }    
	  String k = new String(a);    
	  return k;    
	 }    
	     
   
}
