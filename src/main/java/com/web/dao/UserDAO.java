package com.web.dao;

import java.util.HashMap;

public interface UserDAO {
	public HashMap<String, Object> getUserInfo(HashMap<String, Object> params);
	public int registerUser(HashMap<String, Object> params);
}
