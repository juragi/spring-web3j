package com.web.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> params) {
		return sqlSession.selectOne("userMapper.getUserInfo", params);
	}

	@Override
	public int registerUser(HashMap<String, Object> params) {
		return sqlSession.insert("userMapper.registerUser", params);
	}

}
