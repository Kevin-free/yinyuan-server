package com.kevin.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kevin.dao.UserDaoImp;
import com.kevin.dbutil.DBUtil;
import com.kevin.pojo.User;

public class UserServiceDao {

	/**
	 * 增加用户
	 * 
	 * @param user
	 * @return 布尔型是否
	 */
	public boolean insert(User user) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserDaoImp userD = new UserDaoImp(conn);
		try {
			Boolean isInsert = userD.insert(user);
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

	/**
	 * 通过openId查询用户
	 * 
	 * @param user
	 * @return userId
	 */
	public int selectByOpenId(String openId) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserDaoImp userD = new UserDaoImp(conn);
		try {
			int selectUserId = userD.selectByOpenId(openId);
			conn.commit();
			return selectUserId;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			return -1;
		} finally {
			if (conn != null) {
				DBUtil.closeConnection(conn);
			}
		}
	}

	public boolean updateZyyzsAndYingan(Integer userId, Integer hostId, Integer ppzs, Integer addyingan) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserDaoImp userD = new UserDaoImp(conn);
		try {
			boolean isUpdateUser = userD.updateZyyzsAndYingan(userId,hostId,ppzs,addyingan);
			conn.commit();
			return isUpdateUser;
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

	public ArrayList<User> getRankInfo() {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserDaoImp userD = new UserDaoImp(conn);
		try {
			ArrayList<User> userList = userD.getRankInfo();
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

	public List<User> getUserYYInfo(Integer id) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserDaoImp userD = new UserDaoImp(conn);
		try {
			ArrayList<User> userList = userD.getUserYYInfo(id);
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

	public boolean updateYinganByYinyuan(Integer id) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserDaoImp userD = new UserDaoImp(conn);
		try {
			boolean isUpdate = userD.updateYinganByYinyuan(id);
			conn.commit();
			return isUpdate;
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

	public User getUserInfoById(Integer userId) {{
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserDaoImp userDao = new UserDaoImp(conn);
        try {
            User user = new User();
            user = userDao.getUserInfoById(userId);
            conn.commit();
            return user;
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
    }}

}
