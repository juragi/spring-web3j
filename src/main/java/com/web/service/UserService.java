package com.web.service;

import java.util.HashMap;

public interface UserService {
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> params);
	public int registerUser(HashMap<String, Object> params);
	public int login(HashMap<String, Object> params);
}
