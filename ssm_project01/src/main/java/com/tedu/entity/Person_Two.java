package com.tedu.entity;

public class Person_Two {
	
	private int id;
	
	private String two_name;
	
	private int pid;

	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTwo_name() {
		return two_name;
	}


	public void setTwo_name(String two_name) {
		this.two_name = two_name;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	@Override
	public String toString() {
		return "Person_Two [id=" + id + ", two_name=" + two_name + ", pid=" + pid + "]";
	}
	
	
	
}
