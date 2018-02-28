package com.csair.admin.core.po.core.resp;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 */
public class DatagridForLayUI<T> implements java.io.Serializable {

	private static final long serialVersionUID = 4137170628914512450L;

	private Long count = 0L;
	private String code = "";
	private String msg = "";
	private List<T> data = new ArrayList();

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

}
