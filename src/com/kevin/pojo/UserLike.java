package com.kevin.pojo;

public class UserLike {
	protected Integer userId;
	protected Integer songId;
	protected Integer state;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getSongId() {
		return songId;
	}
	public void setSongId(Integer songId) {
		this.songId = songId;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public UserLike(Integer userId, Integer songId, Integer state) {
		super();
		this.userId = userId;
		this.songId = songId;
		this.state = state;
	}
	@Override
	public String toString() {
		return "UserLike [userId=" + userId + ", songId=" + songId + ", state=" + state + "]";
	}
	
}
