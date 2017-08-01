package com.test.dao;

import java.util.List;

import com.test.model.Login;

public interface LoginDao {
	int deleteByPrimaryKey(Long id);

	int insert(Login record);

	Login selectByPrimaryKey(Long id);

	List<Login> selectAll();

	int updateByPrimaryKey(Login record);
}