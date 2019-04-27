package com.ssl.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ssl.dao.EmpMapper;
import com.ssl.entity.Emp;

@Service
public class EmpServiceImp implements EmpService{
	@Resource
	private EmpMapper empMapper;
	@Resource
	private Emp emp;

	public String selectStuFenye(HttpServletRequest request) {
		String pageStr = request.getParameter("page");
		String pageSizeStr = request.getParameter("rows");
		String eidStr=request.getParameter("eid");
		String ename = request.getParameter("ename");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String sex = request.getParameter("sex");
		Integer page=1;
		Integer pageSize=10;
		Integer eid=null;
		if(pageStr!=null){
			page=Integer.parseInt(pageStr);
		}
		if(pageSizeStr!=null){
			pageSize=Integer.parseInt(pageSizeStr);
		}
		if(eidStr!=null && eidStr !=""){
			eid=Integer.parseInt(eidStr);
		}
		emp.setPage((page-1)*pageSize);
		emp.setPageSize(pageSize);
		emp.setEid(eid);
		emp.setEname(ename);
		emp.setStartTime(startTime);
		emp.setEndTime(endTime);
		emp.setSex(sex);
		System.out.println(emp);
		Integer total=empMapper.selectEmpCount(emp);
		List<Emp> rows = empMapper.selectEmp(emp);
		
		emp.setRows(rows);
		emp.setTotal(total);
		Gson gson=new Gson();
		String json = gson.toJson(emp);
		
		
		return json;
	}

	public Integer updateEmp(HttpServletRequest request) {

		String eidStr=request.getParameter("eid");
		String ename=request.getParameter("ename");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String sale=request.getParameter("sale");
		
		Integer eid=null;
		if(eidStr!=null && eidStr !=""){
			eid=Integer.parseInt(eidStr);
		}
		emp.setEid(eid);
		emp.setEname(ename);
		emp.setSex(sex);
		emp.setAge(Integer.parseInt(age));
		emp.setSale(Double.parseDouble(sale));
		Integer i = empMapper.updateEmp(emp);
		return i;
	}

	public Integer delEmp(HttpServletRequest request) {
		String eidStr=request.getParameter("eid");
		Integer eid=null;
		if(eidStr!=null && eidStr !=""){
			eid=Integer.parseInt(eidStr);
		}
		emp.setEid(eid);
		Integer i = empMapper.delEmp(eid);
		return i;
	}

	public Integer addEmp(HttpServletRequest request) {
		String eidStr=request.getParameter("eid");
		String ename=request.getParameter("ename");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String ruzhidate=request.getParameter("ruzhidate");
		String sale=request.getParameter("sale");
		
		Integer eid=null;
		if(eidStr!=null && eidStr !=""){
			eid=Integer.parseInt(eidStr);
		}
		emp.setEid(eid);
		emp.setEname(ename);
		emp.setSex(sex);
		emp.setAge(Integer.parseInt(age));
		emp.setRuzhidate(ruzhidate);
		emp.setSale(Double.parseDouble(sale));
		Integer i = empMapper.addEmp(emp);
		return i;
	}


}
