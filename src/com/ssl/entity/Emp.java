package com.ssl.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Emp {
	private Integer eid;
	private String ename;
	private String sex;
	private Integer age;
	private String ruzhidate;
	private Double sale;
	
	private String startTime;
	private String endTime;
	
	

	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	//分页参数
	private Integer page;//页码
	private Integer pageSize;//每页的条数
	private Integer total;
	private List<Emp> rows;
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getRuzhidate() {
		return ruzhidate;
	}
	public void setRuzhidate(String ruzhidate) {
		this.ruzhidate = ruzhidate;
	}
	public Double getSale() {
		return sale;
	}
	public void setSale(Double sale) {
		this.sale = sale;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<Emp> getRows() {
		return rows;
	}
	public void setRows(List<Emp> rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "Emp [eid=" + eid + ", ename=" + ename + ", sex=" + sex + ", age=" + age + ", ruzhidate=" + ruzhidate
				+ ", sale=" + sale + ", startTime=" + startTime + ", endTime=" + endTime + ", page=" + page
				+ ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + "]";
	}

	
	

}
