package com.kevin.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kevin.dao.YinyuanDaoImp;
import com.kevin.dbutil.DBUtil;
import com.kevin.pojo.User;
import com.kevin.pojo.UserPp;
import com.kevin.pojo.Yinyuan;

public class YinyuanServiceDao {
	
	public boolean insert(Yinyuan yinyuan) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		YinyuanDaoImp yyd = new YinyuanDaoImp(conn);
		try {
			Boolean isInsert = yyd.insert(yinyuan);
			conn.commit();
			return isInsert;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return false;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public ArrayList<User> getUserAva(String yyNum) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		YinyuanDaoImp yyd = new YinyuanDaoImp(conn);
		try {
			ArrayList<User> userList = yyd.getUserAva(yyNum);
			conn.commit();
			return userList;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public ArrayList<UserPp> getUserPp(String yyNum) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		YinyuanDaoImp yyd = new YinyuanDaoImp(conn);
		try {
			ArrayList<UserPp> userList = yyd.getUserPp(yyNum);
			conn.commit();
			return userList;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return null;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}
}
