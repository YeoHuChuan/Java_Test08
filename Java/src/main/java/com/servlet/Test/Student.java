package com.servlet.Test;

import java.util.ArrayList;

public class Student {
	
	private String studentID;
	private String studentName; 
	private String department;
	private int mark;
	
	public Student(String studentID, String studentName, String department, int mark) {
		this.studentID = studentID;
		this.studentName = studentName;
		this.department = department;
		this.mark = mark;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
	
	public ArrayList<Student> getStudentDetails()
	{
		ArrayList<Student> stdList = new ArrayList<Student>();
		 
		stdList.add(new Student("S1", "Karan", "Dep 1", 35));
		stdList.add(new Student("S2", "John", "Dep 1", 70));
		stdList.add(new Student("S3", "Farah", "Dep 1", 60));
		stdList.add(new Student("S4", "Lesly", "Dep 1", 90));
		stdList.add(new Student("S5", "Haya", "Dep 2", 30));
		stdList.add(new Student("S6", "Ali", "Dep 3", 32));
		stdList.add(new Student("S7", "Koko", "Dep 3", 70));
		stdList.add(new Student("S8", "Rengar", "Dep 3", 20));
		
		return stdList;
	}


}
