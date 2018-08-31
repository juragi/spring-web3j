package com.test;

import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/root-context.xml" })
public class SimpleTest {
	@Autowired
	UserService userService;
	
	@Test
	public void test() {
		System.out.println("this is test");
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("email", "test@test.test");
		System.out.println(userService.getUserInfo(params));
	}
}
