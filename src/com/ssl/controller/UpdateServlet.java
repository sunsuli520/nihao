package com.ssl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssl.service.EmpServiceImp;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//��������
		ApplicationContext context=new ClassPathXmlApplicationContext("ApplicationContext.xml");
		EmpServiceImp bean = (EmpServiceImp) context.getBean("empServiceImp");
		 Integer json = bean.updateEmp(request);
		PrintWriter out=response.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}

}
