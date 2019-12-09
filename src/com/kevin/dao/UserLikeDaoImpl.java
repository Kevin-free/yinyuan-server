package com.kevin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kevin.pojo.Song;
import com.kevin.pojo.UserLike;
import com.kevin.pojo.UserSong;

public class UserLikeDaoImpl {

	private Connection conn = null;
	private PreparedStatement pst = null;

	/**
	 * 定义构造方法，实例化的时候完成连接的注入
	 */
	public UserLikeDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addLike(UserLike userLike) {
		try {
			String sql = "INSERT into userlike(userId,songId,state) values(?,?,?)"
					+ " on  DUPLICATE key update state = ? ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userLike.getUserId());
			pst.setInt(2, userLike.getSongId());
			pst.setInt(3, userLike.getState());
			pst.setInt(4, userLike.getState());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public Boolean delLike(UserLike userLike) {
		try {
			String sql = "UPDATE userlike SET state = ? WHERE userId = ? AND songId = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userLike.getState());
			pst.setInt(2, userLike.getUserId());
			pst.setInt(3, userLike.getSongId());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Integer> getMyLikeList(Integer userId) {
		try {
			String sql = "SELECT songId FROM `userlike` WHERE userId = ? AND state = 1";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			List<Integer> likeListIds = new ArrayList<Integer>();
			if (rs.next()) {
				for (int i = 0; i <= rs.getRow(); i++) {
					Integer songId = rs.getInt("songId");
					likeListIds.add(songId);
					rs.next();
				}
			}
			return likeListIds;
		} catch (Exception e) {
			return null;
		}
	}

}
