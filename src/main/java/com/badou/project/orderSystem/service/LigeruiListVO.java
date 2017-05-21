package com.badou.project.orderSystem.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

public class LigeruiListVO<T> {
	
	private int total = 0;
	private List<Object> rows = new ArrayList<Object>();
	@JSON(name="Total")
	public int getTotal() {
		return total;
	}
	
	public void setTotal(int total) {
		this.total = total;
	}
	@JSON(name="Rows")
	public List<Object> getRows() {
		return rows;
	}
	public void setRows(List<Object> rows) {
		this.rows = rows;
	}
	
	
}
