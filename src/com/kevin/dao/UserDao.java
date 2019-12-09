package com.kevin.dao;

import java.sql.SQLException;

import com.kevin.pojo.User;

public interface UserDao {

	  public boolean insert(User user) throws SQLException;//添加
}
