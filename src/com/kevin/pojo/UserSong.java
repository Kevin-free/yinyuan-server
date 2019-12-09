package com.kevin.pojo;

public class UserSong {
	protected Integer userId;
	protected Integer nesongId;
	protected Integer score;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getNesongId() {
		return nesongId;
	}
	public void setNesongId(Integer nesongId) {
		this.nesongId = nesongId;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "UserSong [userId=" + userId + ", nesongId=" + nesongId + ", score=" + score + "]";
	}
	public UserSong(Integer userId, Integer nesongId, Integer score) {
		super();
		this.userId = userId;
		this.nesongId = nesongId;
		this.score = score;
	}
	public UserSong(Integer userId, Integer nesongId) {
		super();
		this.userId = userId;
		this.nesongId = nesongId;
	}
	
}
