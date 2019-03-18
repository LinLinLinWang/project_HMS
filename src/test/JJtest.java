package test;

import org.junit.Test;


public class JJtest {
	
	@Test
	public void test() {
	  System.out.println("select * from patienthistory where DRegisteId="+"\""+1111+"\"and datediff("+"\""+111+"\""+",PComeHospitalTime)<=3");
	}

}
