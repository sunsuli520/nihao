package com.ssl.dao;

import java.util.List;

import com.ssl.entity.Emp;

public interface EmpMapper {
	List<Emp> selectEmp(Emp e);
	Integer selectEmpCount(Emp e);
	Integer updateEmp(Emp e);
	Integer delEmp(Integer eid);
	Integer addEmp(Emp e);
}
