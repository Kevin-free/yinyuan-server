package com.kevin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kevin.pojo.User;

public class YinganDaoImp {

	private Connection conn = null;
	private PreparedStatement pst = null;
	
	public YinganDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public Boolean update(User user) {
		try {
			String sql="UPDATE user SET yingandu=? WHERE id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, user.getYingandu());
			pst.setInt(2, user.getId());
		      pst.executeUpdate();
		      return true;
		} catch (SQLException e) {
			e.printStackTrace();
		      return false;
		}
	}

	public Integer getYingan(Integer id) {
		try {
			String sql="SELECT yingandu FROM user WHERE id=?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			Integer returnYingan = 0;
			while (rs.next()) {
				returnYingan = rs.getInt(1);
			}
			return returnYingan;
		} catch (SQLException e) {
			e.printStackTrace();
		      return 0;
		}
	}
}
