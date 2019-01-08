package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;

@Controller
public class Web3Controller {
	private static final Logger logger = LoggerFactory.getLogger(Web3Controller.class);
	
	@ResponseBody
	@RequestMapping(value="web3/generate", method=RequestMethod.POST)
	public HashMap<String, Object> generate(@RequestParam String password) throws Exception {
		HashMap<String, Object> result = new HashMap<String, Object>();
		String savePath = "D:/upload/";
		File saveLocation = new File(savePath);
		if(!saveLocation.exists()) saveLocation.mkdir();
		
		String fileName = WalletUtils.generateNewWalletFile(password, saveLocation);
		Credentials cre = WalletUtils.loadCredentials(password, new File(saveLocation.getPath()+ "/" + result));
		String address = cre.getAddress();
		
		result.put("fileName", fileName);
		result.put("address", address);
		
		return result;
	}
}
