package com.web.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO userDAO;

	@Override
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> params) {
		return userDAO.getUserInfo(params);
	}

	@Override
	public int registerUser(HashMap<String, Object> params) {
		// email 중복 확인, password 암호화
		if(userDAO.getUserInfo(params) != null) return -1; // 이미 가입된 이메일
		
		String password = (String) params.get("password");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		params.put("password", hashedPassword);
		return userDAO.registerUser(params);
	}

	@Override
	public int login(HashMap<String, Object> params) {
		HashMap<String, Object> user = userDAO.getUserInfo(params);
		if(user == null) return -1; // 가입되지 않은 회원
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if(passwordEncoder.matches((String) params.get("password"), (String) user.get("password"))) {
			return 1;	
		}
		return 0;
	}

}
