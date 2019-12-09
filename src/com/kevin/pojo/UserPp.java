package com.kevin.pojo;

public class UserPp {
	protected String wxNickName;
	protected String wxAvatarUrl;
	protected int ppzs; //匹配指数
	
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
	public int getPpzs() {
		return ppzs;
	}
	public void setPpzs(int ppzs) {
		this.ppzs = ppzs;
	}
	@Override
	public String toString() {
		return "UserPp [wxNickName=" + wxNickName + ", wxAvatarUrl=" + wxAvatarUrl + ", ppzs=" + ppzs + "]";
	}
	
	
}
