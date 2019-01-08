package com.test;

import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;

import com.web.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/config/root-context.xml" })
public class SimpleTest {
	@Autowired
	UserService userService;
	
	@Test
	public void test() throws Exception {
		System.out.println("wallet generate test");
		File location = new File("D:/upload");
		if(!location.exists()) location.mkdir();
		
		String result = WalletUtils.generateNewWalletFile("testtest1", location);
		System.out.println(result);
		Credentials c = WalletUtils.loadCredentials("testtest1", new File(location.getPath()+ "/" + result));
		System.out.println(c.getAddress());
	}
}
