package com.kevin.json;

import java.util.ArrayList;
import java.util.List;

public class jsonResult {
	private boolean success=true;
	private Integer code = 0;
	private String msg;
	private long total;
	private int pageSize;
	private List rows=new ArrayList(0);
	
	
	
	public jsonResult(boolean success, String msg, long total, int pageSize, List datas) {
		super();
		this.success = success;
		this.msg = msg;
		this.total = total;
		this.pageSize = pageSize;
		this.rows = datas;
	}

	public void setErrMsg(String msg){
		this.success=false;
		this.msg=msg;
	}
	
   public void add(List datas){
	   if(datas!=null){
	   this.rows.addAll(datas);
	   this.total=this.rows.size();
	   }
   }
   public void add(Object data){
	   rows.add(data);
	   this.total=1;
   }
	
	

	public jsonResult(String msg) {
		super();
		this.msg = msg;
	}



	public jsonResult(List datas) {
		super();
		this.rows = datas;
		if(datas!=null)
		this.total=datas.size();
	}

 

	public jsonResult(boolean success, String msg) {
		super();
		this.success = success;
		this.msg = msg;
	}
	public jsonResult(boolean success, String msg,List datas) {
		super();
		this.success = success;
		this.msg = msg;
		rows.addAll(datas);
	}

	public jsonResult() {
	}



	public boolean getSuccess() {
		return success;
	}



	public void setSuccess(boolean success) {
		this.success = success;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}



	public long getTotal() {
		return total;
	}



	public void setTotal(long total) {
		this.total = total;
	}



	public int getPageSize() {
		return pageSize;
	}



	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	public List getRows() {
		return rows;
	}



	public void setRows(List datas) {
		this.rows = datas;
	}
	
	public Integer getCode() {
		if(success==true){
			return 0;
		}
		else{
			return 1;
		}
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "jsonResult [success=" + success + ", msg=" + msg + ", total=" + total + ", pageSize=" + pageSize
				+ ", rows=" + rows + "]";
	}
	
	
	
	
}
