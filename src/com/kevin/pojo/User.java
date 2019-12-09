package com.kevin.pojo;

public class User {
	protected Integer id;
	protected String wxOpenId;
	protected String wxNickName;
	protected String wxAvatarUrl;
	protected Integer wxGender;
	protected Integer yingandu; //音感度 数据库默认100
	protected Integer zyyzs; //总音感指数
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getWxOpenId() {
		return wxOpenId;
	}
	public void setWxOpenId(String wxOpenId) {
		this.wxOpenId = wxOpenId;
	}
	public String getWxNickName() {
		return wxNickName;
	}
	public void setWxNickName(String wxNickName) {
		this.wxNickName = wxNickName;
	}
	public String getWxAvatarUrl() {
		return wxAvatarUrl;
	}
	public void setWxAvatarUrl(String wxAvatarUrl) {
		this.wxAvatarUrl = wxAvatarUrl;
	}
	public Integer getWxGender() {
		return wxGender;
	}
	public void setWxGender(Integer wxGender) {
		this.wxGender = wxGender;
	}
	public Integer getYingandu() {
		return yingandu;
	}
	public void setYingandu(Integer yingandu) {
		this.yingandu = yingandu;
	}
	public Integer getZyyzs() {
		return zyyzs;
	}
	public void setZyyzs(Integer zyyzs) {
		this.zyyzs = zyyzs;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", wxOpenId=" + wxOpenId + ", wxNickName=" + wxNickName + ", wxAvatarUrl="
				+ wxAvatarUrl + ", wxGender=" + wxGender + ", yingandu=" + yingandu + ", zyyzs=" + zyyzs + "]";
	}
	
	public User() {
		super();
	}
	
	public User(String wxOpenId,String wxNickName,String wxAvatarUrl,Integer wxGender) {
		super();
		this.wxOpenId = wxOpenId;
		this.wxNickName = wxNickName;
		this.wxAvatarUrl = wxAvatarUrl;
		this.wxGender = wxGender;
	}
	
	public User(String wxNickName, String wxAvatarUrl) {
		super();
		this.wxNickName = wxNickName;
		this.wxAvatarUrl = wxAvatarUrl;
	}
	
}
