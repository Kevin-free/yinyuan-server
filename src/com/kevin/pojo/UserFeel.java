package com.kevin.pojo;

public class UserFeel {
	protected String yyNum;
	protected int hostId;
	protected int userId;
	protected int songId;
	protected int feelId;
	
	public String getYyNum() {
		return yyNum;
	}
	public void setYyNum(String yyNum) {
		this.yyNum = yyNum;
	}
	public int getHostId() {
		return hostId;
	}
	public void setHostId(int hostId) {
		this.hostId = hostId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getSongId() {
		return songId;
	}
	public void setSongId(int songId) {
		this.songId = songId;
	}
	public int getFeelId() {
		return feelId;
	}
	public void setFeelId(int feelId) {
		this.feelId = feelId;
	}
	@Override
	public String toString() {
		return "UserFeel [yyNum=" + yyNum + ", hostId=" + hostId + ", userId=" + userId + ", songId=" + songId
				+ ", feelId=" + feelId + "]";
	}
	
	public UserFeel() {
		super();
	}
	
	public UserFeel(String yyNum,int hostId,int userId,int songId,int feelId) {
		this.yyNum = yyNum;
		this.hostId = hostId;
		this.userId = userId;
		this.songId = songId;
		this.feelId = feelId;
	}
	
}
