package com.ssl.service;

import javax.servlet.http.HttpServletRequest;

public interface EmpService {
	String selectStuFenye(HttpServletRequest request);
	//�޸�
		Integer updateEmp(HttpServletRequest request);
		Integer delEmp(HttpServletRequest request);
		Integer addEmp(HttpServletRequest request);
}
