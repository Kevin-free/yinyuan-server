package com.kevin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kevin.pojo.User;
import com.kevin.pojo.User;

public class UserDaoImp implements UserDao {

	private Connection conn = null;
	private PreparedStatement pst = null;

	/**
	 * 定义构造方法，实例化的时候完成连接的注入
	 */
	public UserDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean insert(User user) throws SQLException {
		try {
			String sql = "insert into user(wxOpenId,wxNickName,wxAvatarUrl,wxGender) values(?,?,?,?) ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getWxOpenId());
			pst.setString(2, user.getWxNickName());
			pst.setString(3, user.getWxAvatarUrl());
			pst.setInt(4, user.getWxGender());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public int selectByOpenId(String openId) {
		try {
			String sql = "select id from user where wxOpenId=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, openId);
			ResultSet rs = pst.executeQuery();
			int selectUserId = 0;
			if (rs.next()) {
				for (int i = 0; i <= rs.getRow(); i++) {
					System.out.println("---rs:" + rs.getInt("id"));
					selectUserId = rs.getInt("id");
					// crTmp.setPhone(rs.getString("phone"));
					rs.next();
				}
			}
			return selectUserId;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public boolean updateZyyzsAndYingan(Integer userId, Integer hostId, Integer ppzs, Integer addyingan) {
		try {
			String sql = "UPDATE user SET zyyzs=`user`.zyyzs+?,yingandu=`user`.yingandu+? WHERE id IN (?,?);";
			System.out.println("---update sql:" + sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, ppzs);
			pst.setInt(2, addyingan);
			pst.setInt(3, userId);
			pst.setInt(4, hostId);
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public ArrayList<User> getRankInfo() {
		String sql = "SELECT wxNickName,wxAvatarUrl,zyyzs FROM user WHERE `status`=1 ORDER BY zyyzs DESC LIMIT 100;";
		try {
			pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			ArrayList<User> songList = new ArrayList<User>();
			while (rs.next()) {
				User userTmp = new User();
				userTmp.setWxNickName(rs.getString("wxNickName"));
				userTmp.setWxAvatarUrl(rs.getString("wxAvatarUrl"));
				userTmp.setZyyzs(rs.getInt("zyyzs"));
				System.out.println("---userTmp:" + userTmp.toString());
				songList.add(userTmp);
			}
			return songList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<User> getUserYYInfo(Integer id) {
		String sql = "SELECT yingandu,zyyzs FROM user WHERE id=?;";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			ArrayList<User> songList = new ArrayList<User>();
			while (rs.next()) {
				User userTmp = new User();
				userTmp.setYingandu(rs.getInt("yingandu"));
				userTmp.setZyyzs(rs.getInt("zyyzs"));
				System.out.println("---userTmp:" + userTmp.toString());
				songList.add(userTmp);
			}
			return songList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateYinganByYinyuan(Integer id) {
		try {
			String sql = "UPDATE user SET yingandu=`user`.yingandu+5 WHERE id=?;";
			System.out.println("---update sql:" + sql);
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public User getUserInfoById(Integer userId) {{
        String sql = "select * from user where id=?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setLong(1, userId);// 记得要先设置pst.set,在调用rs = pst.exe
            ResultSet rs = pst.executeQuery();
            User user = new User();
            if (rs.next()) {
                for (int i = 0; i <= rs.getRow(); i++) {
                    user.setId(rs.getInt("id"));
                    user.setWxNickName(rs.getString("wxNickName"));
                    user.setWxAvatarUrl(rs.getString("wxAvatarUrl"));
                    user.setWxGender(rs.getInt("wxGender"));
                    rs.next();
                }
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }}

}
