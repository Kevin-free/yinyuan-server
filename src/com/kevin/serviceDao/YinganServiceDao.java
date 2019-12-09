package com.kevin.serviceDao;

import java.sql.Connection;
import java.sql.SQLException;

import com.kevin.dao.YinganDaoImp;
import com.kevin.dbutil.DBUtil;
import com.kevin.pojo.User;

public class YinganServiceDao {
	public boolean update(User user) {
		Connection conn = DBUtil.getConnection();
		YinganDaoImp ygd = new YinganDaoImp(conn);
	    try{
	      Boolean isUpd = ygd.update(user);
	      conn.commit();
	      return isUpd;
	    }catch(Exception e){
	      try {conn.rollback();} 
	      catch (SQLException ex) {ex.printStackTrace();}
	      return false;
	    }finally{
	      if(conn != null){DBUtil.closeConnection(conn);}
	    }
	}

	public Integer getYingan(Integer id) {
		Connection conn = DBUtil.getConnection();
		YinganDaoImp ygd = new YinganDaoImp(conn);
	    try{
	    Integer returnYingan = ygd.getYingan(id);
	      conn.commit();
	      return returnYingan;
	    }catch(Exception e){
	      try {conn.rollback();} 
	      catch (SQLException ex) {ex.printStackTrace();}
	      return 0;
	    }finally{
	      if(conn != null){DBUtil.closeConnection(conn);}
	    }
	}
}
