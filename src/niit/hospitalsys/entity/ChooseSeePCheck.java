package niit.hospitalsys.entity;

import java.util.Date;

public class ChooseSeePCheck {
  private String name;
  private String uid;
  private  String gender;
  private   Date outresult;
  private int hid;
  
public int getHid() {
	return hid;
}
public void setHid(int hid) {
	this.hid = hid;
}
public Date getOutresult() {
	return outresult;
}
public void setOutresult(Date outresult) {
	this.outresult = outresult;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getUid() {
	return uid;
}
public void setUid(String uid) {
	this.uid = uid;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
 
}
