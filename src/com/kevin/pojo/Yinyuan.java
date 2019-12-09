package com.kevin.pojo;

public class Yinyuan {
	protected int userId;
	protected int hostId;
	protected String yyNum;
	protected int ppzs;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getHostId() {
		return hostId;
	}
	public void setHostId(int hostId) {
		this.hostId = hostId;
	}
	public String getYyNum() {
		return yyNum;
	}
	public void setYyNum(String yyNum) {
		this.yyNum = yyNum;
	}
	public int getPpzs() {
		return ppzs;
	}
	public void setPpzs(int ppzs) {
		this.ppzs = ppzs;
	}
	@Override
	public String toString() {
		return "Yinyuan [userId=" + userId + ", hostId=" + hostId + ", yyNum=" + yyNum + ", ppzs=" + ppzs + "]";
	}
	public Yinyuan() {
		super();
	}
	public Yinyuan(int userId, int hostId, String yyNum, int ppzs) {
		super();
		this.userId = userId;
		this.hostId = hostId;
		this.yyNum = yyNum;
		this.ppzs = ppzs;
	}
	
}
