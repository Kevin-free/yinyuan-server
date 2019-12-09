package com.kevin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kevin.pojo.UserFeel;

public class UserFeelDaoImp {

	private Connection conn = null;
	private PreparedStatement pst = null;

	/**
	 * 定义构造方法，实例化的时候完成连接的注入
	 */
	public UserFeelDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean insert(UserFeel userFeel) {
		try {
			String sql = "insert into userfeel(yyNum,hostId,userId,songId,feelId) values(?,?,?,?,?) ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, userFeel.getYyNum());
			pst.setInt(2, userFeel.getHostId());
			pst.setInt(3, userFeel.getUserId());
			pst.setInt(4, userFeel.getSongId());
			pst.setInt(5, userFeel.getFeelId());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
