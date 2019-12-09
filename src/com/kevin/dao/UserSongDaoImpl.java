package com.kevin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kevin.pojo.UserSong;

public class UserSongDaoImpl {

	private Connection conn = null;
	private PreparedStatement pst = null;

	/**
	 * 定义构造方法，实例化的时候完成连接的注入
	 */
	public UserSongDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public Boolean adduserSong(UserSong userSong) {
		try {
			String sql = "INSERT into usersong(userId,nesongId) values(?,?)"
					+ " on  DUPLICATE key update userId = ? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userSong.getUserId());
			pst.setInt(2, userSong.getNesongId());
			pst.setInt(3, userSong.getUserId());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public Boolean updateUserSong(UserSong userSong) {
		try {
			String sql = "INSERT into usersong(userId,nesongId,score) values(?,?,?)"
					+ " on  DUPLICATE key update score = score + ? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userSong.getUserId());
			pst.setInt(2, userSong.getNesongId());
			pst.setInt(3, userSong.getScore());
			pst.setInt(4, userSong.getScore());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
