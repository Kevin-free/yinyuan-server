package com.kevin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.kevin.pojo.User;
import com.kevin.pojo.UserPp;
import com.kevin.pojo.Yinyuan;

public class YinyuanDaoImp {

	private Connection conn = null;
	private PreparedStatement pst = null;

	/**
	 * 定义构造方法，实例化的时候完成连接的注入
	 */
	public YinyuanDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean insert(Yinyuan yinyuan) {
		try {
			String sql = "insert into yinyuan(userId,hostId,yyNum,ppzs) values(?,?,?,?) ";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, yinyuan.getUserId());
			pst.setInt(2, yinyuan.getHostId());
			pst.setString(3, yinyuan.getYyNum());
			pst.setInt(4, yinyuan.getPpzs());
			pst.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public ArrayList<User> getUserAva(String yyNum) throws Exception {
		try {
			String sql = "select wxNickName,wxAvatarUrl from user where id in(select userId from yinyuan where yyNum=?)";
			System.out.println("sql:" + sql + ",yynum:" + yyNum);
			pst = conn.prepareStatement(sql);
			pst.setString(1, yyNum);// 记得要先设置pst.set,在调用rs = pst.exe
			ResultSet rs = pst.executeQuery();
			ArrayList<User> userList = new ArrayList<>();
			while (rs.next()) {
				// for(int i=0;i<=rs.getRow();i++){
				User userppTmp = new User(rs.getString(1), rs.getString(2));
				// userppTmp.setWxNickName(rs.getString(1)); //rs的下标从1开始
				// userppTmp.setWxAvatarUrl(rs.getString(2));
				System.out.println("---userppTmp:" + userppTmp);
				userList.add(userppTmp);
				// rs.next();
				// }
			}
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public ArrayList<UserPp> getUserPp(String yyNum) throws Exception {
		try {
			String sql = "SELECT wxNickName,wxAvatarUrl,ppzs FROM user,yinyuan WHERE yinyuan.yyNum=? AND user.id=yinyuan.userId";
			System.out.println("sql:" + sql + ",yynum:" + yyNum);
			pst = conn.prepareStatement(sql);
			pst.setString(1, yyNum);// 记得要先设置pst.set,在调用rs = pst.exe
			ResultSet rs = pst.executeQuery();
			ArrayList<UserPp> userList = new ArrayList<>();
			while (rs.next()) {
				// for(int i=0;i<=rs.getRow();i++){
				UserPp userppTmp = new UserPp();
				userppTmp.setWxNickName(rs.getString(1)); // rs的下标从1开始
				userppTmp.setWxAvatarUrl(rs.getString(2));
				userppTmp.setPpzs(rs.getInt(3));
				/*try {
					String sql2 = "SELECT ppzs FROM yinyuan WHERE yyNum=?";
					pst = conn.prepareStatement(sql2);
					pst.setString(1, yyNum);// 记得要先设置pst.set,在调用rs = pst.exe
					ResultSet rs2 = pst.executeQuery();
					 while (rs2.next()) {
					userppTmp.setPpzs(rs2.getInt(1));
					 }
				} catch (Exception e) {
					throw e;
				}*/
				System.out.println("---userppTmp:" + userppTmp);
				userList.add(userppTmp);
				// rs.next();
				// }
			}
			return userList;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
