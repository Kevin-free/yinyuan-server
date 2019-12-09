package com.kevin.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;

import com.kevin.dao.UserFeelDaoImp;
import com.kevin.dbutil.DBUtil;
import com.kevin.pojo.UserFeel;

public class UserFeelServiceDao {
	/**
	 * 插入记录
	 * @param userFeel
	 * @return 布尔型
	 */
	public boolean insert(UserFeel userFeel) {
		Connection conn = DBUtil.getConnection(); // 在方法内每次调用连接数据库，以免出现conn.close异常
		UserFeelDaoImp ufD = new UserFeelDaoImp(conn);
		try {
			Boolean isInsert = ufD.insert(userFeel);
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
	
}
