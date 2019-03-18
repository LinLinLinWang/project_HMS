package test;

public class Student {
	String name;
	String count;
	
	String money;
	String total_money ;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getTotal_money() {
		return total_money;
	}
	public void setTotal_money(String total_money) {
		this.total_money = total_money;
	}
	public Student(String name, String count, String money, String total_money) {
		super();
		this.name = name;
		this.count = count;
		this.money = money;
		this.total_money = total_money;
	}
	
}
