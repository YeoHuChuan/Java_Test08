package com.servlet.Test;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class JavaTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		if(userId.equals("Ali") && password.equals("Abc123")) { 
	        Student stdDetails = new Student("S0", "", "", 0);
	        
	        ArrayList<Student> stdList =  stdDetails.getStudentDetails();
	        ArrayList<String> department = new ArrayList<>();
	        ArrayList<Integer> count = new ArrayList<>();
	        ArrayList<String> pass = new ArrayList<>();
	        
	        for (int i = 0 ; i < stdList.size() ; i++) {
	        	if (!department.contains(stdList.get(i).getDepartment())) {
	        		department.add(stdList.get(i).getDepartment());
	        	}
	        }
	        
	        int countDept = 0;
	        double passStudent = 0;
	        for (int i = 0 ; i < department.size() ; i++) {
	        	for (int j = 0 ; j < stdList.size() ; j++) {
	        		if(department.get(i).equals(stdList.get(j).getDepartment())) {
	        			if (stdList.get(j).getMark() >= 40) {
	        				passStudent++;
	        			}
	        			countDept++;
	        		}
	        	}
	        	
	        	pass.add(i, fmt((double) Math.round((passStudent/countDept * 100) * 100) / 100));
	        	count.add(i , countDept);
	        	passStudent = 0;
	        	countDept = 0;
	        }
			  
			request.setAttribute("userId", userId);
			request.setAttribute("stdList", stdList);
			request.setAttribute("department", department);
			request.setAttribute("count", count);
			request.setAttribute("pass", pass);
			  
			RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");

			rd.forward(request, response);
			  
		} else {
			
			request.setAttribute("error", "error");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");

			rd.forward(request, response);
			
		}
	
	}
	
	public String fmt(double value) {
		if(value == (long) value)
            return String.format("%d",(long) value);
        else
        	return String.format("%s",value);
	}

}
