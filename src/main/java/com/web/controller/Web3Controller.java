package com.web.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.util.EthUtil;

@Controller
public class Web3Controller {
	private static final Logger logger = LoggerFactory.getLogger(Web3Controller.class);
	
	private static final String savePath = "D:/upload/";
	
	@ResponseBody
	@RequestMapping(value="web3/generate", method=RequestMethod.POST)
	public String generate(@RequestParam String password) throws Exception {
		EthUtil ethUtil = new EthUtil();
		return ethUtil.createWallet(password, savePath);
	}
	
	@ResponseBody
	@RequestMapping(value="web3/send", method=RequestMethod.POST)
	public String send(@RequestBody HashMap<String, Object> params) throws Exception {
		EthUtil ethUtil = new EthUtil();
		String fileName = (String) params.get("fileName");
		String password = (String) params.get("password");
		double amount = (double) params.get("amount");
		String toAddress = (String) params.get("toAddress");
		return ethUtil.send(fileName, password, amount, toAddress, savePath);
	}
	
	@ResponseBody
	@RequestMapping(value="web3/balance", method=RequestMethod.POST)
	public BigDecimal getBalance(@RequestParam String address) throws IOException {
		EthUtil ethUtil = new EthUtil();
		return ethUtil.getBalance(address);
	}
	
	@ResponseBody
	@RequestMapping(value="web3/recentBlock", method=RequestMethod.POST)
	public BigInteger getRecentBlock() throws IOException {
		EthUtil ethUtil = new EthUtil();
		return ethUtil.getBlock();
	}
	
	@ResponseBody
	@RequestMapping(value="web3/tx", method=RequestMethod.POST)
	public String tx(@RequestParam String txid) throws IOException {
		EthUtil ethUtil = new EthUtil();
		return ethUtil.getTransaction(txid);
	}
}
