package com.web.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}
	
	@ResponseBody
	@RequestMapping(value="login", method=RequestMethod.POST)
	public int login(@RequestBody HashMap<String, Object> params, HttpSession session) {
		logger.info("params: " + params);
		int result = userService.login(params);
		if(result == 1) session.setAttribute("email", params.get("email"));
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="register", method=RequestMethod.POST)
	public int register(@RequestBody HashMap<String, Object> params) {
		logger.info("params: " + params);
		return userService.registerUser(params);
	}
	
	@ResponseBody
	@RequestMapping(value="logout", method=RequestMethod.POST)
	public int logout(HttpSession session) {
		session.setAttribute("email", null);
		return 1;
	}
	
}
