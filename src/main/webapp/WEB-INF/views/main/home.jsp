<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<P>  The time on the server is ${serverTime}. </P>

<div id="ethApp">
	지갑생성<br/>
	<form id="generateForm">
		<div class="form-row">
			<div class="col-auto">
				<input type="password" name="password" placeholder="password" class="form-control"/>
			</div>
			<div class="col-auto">
				<button type="submit" id="generateButton" class="btn btn-sm btn-primary">generate</button>
			</div>
		</div>
		<div id="createResult">
			<div>파일명: {{ fileName }}</div>
			<div>이더리움 주소: {{ address }}</div>
		</div>
	</form>
	<hr/>
	
	트랜잭션 정보<br/>
	<form id="txForm">
		<div class="form-row">
			<div class="col-8">
				<input type="text" name="txid" placeholder="txid" class="form-control"/>
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-sm btn-primary">check</button>
			</div>
		</div>
		<div>
			<div>txid: {{ tx.txid }}</div>
			<div>from address: {{ tx.from }}</div>
			<div>to address: {{ tx.to }}</div>
			<div>amount: {{ tx.amount }} </div>
		</div>
	</form>
	<hr/>
	
	트랜잭션 receipt 확인<br/>
	<form id="receiptForm">
		<div class="form-row">
			<div class="col-8">
				<input type="text" name="txid" placeholder="txid" class="form-control"/>
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-sm btn-primary">check</button>
			</div>
		</div>
		<div>
			<div>txid: {{ receipt.txid }}</div>
			<div>status: {{ receipt.status }} </div>
		</div>
	</form>
	
	잔액확인<br/>
	<form id="balanceForm">
		<div class="form-row">
			<div class="col-8">
				<input type="text" name="address" placeholder="address" class="form-control"/>
			</div>
			<div class="col-auto">
				<button type="submit" class="btn btn-sm btn-primary">check</button>
			</div>
		</div>
		<div>
			<div>address: {{ balance.address }}</div>
			<div>balance: {{ balance.balance }}</div>
		</div>
	</form>
	<hr/>
	
	최신블록확인<br/>
	<button id="blockButton">check</button>
	<span>{{ block }}</span>
</div>
<script>
	var ethApp = new Vue({
		el: "#ethApp",
		data: {
			fileName: "", 
			address: "",
			tx: {
				txid: "",
				to: "",
				from: "",
				amount: ""
			},
			receipt: {
				txid: "",
				status: ""
			},
			balance: {
				address: "",
				balance: ""
			},
			block: ""
		},
		methods: {
			newWallet: function(fileName, address) {
				this.fileName = fileName;
				this.address = address;
			}
		}
	});
	const web3 = new Web3(new Web3.providers.HttpProvider("https://mainnet.infura.io/f7lCFyNhcZYorDJ17vYD"));
	$(document).ready(function(){
		
		$("#generateForm").submit(function(e){
			e.preventDefault();
			var param = {password: $(this).find("input[name=password]").val()};
			$.post("web3/generate", param, function(data){
				ethApp.newWallet(data.fileName, data.address);
			}, 'json');
		});
		
		$("#txForm").submit(function(e){
			e.preventDefault();
			$.post("web3/tx", {txid: $(this).find("input[name=txid]").val()}, function(data){
				ethApp.tx.from = data.from;
				ethApp.tx.to = data.to;
				ethApp.tx.txid = data.hash;
				ethApp.tx.amount = web3.fromWei(data.value, 'ether') + " ETH";
			}, 'json')
		});
		
		$("#receiptForm").submit(function(e){
			e.preventDefault();
			var txid = $(this).find("input[name=txid]").val();
			$.post("web3/receipt", {txid: txid}, function(data){
				ethApp.receipt.txid = data.transactionHash;
				ethApp.receipt.status = data.status;
			}, 'json');
		})
		
		$("#balanceForm").submit(function(e){
			e.preventDefault();
			var address = $(this).find("input[name=address]").val();
			$.ajax({
				url: 'web3/balance',
				data: {address: address},
				type: 'POST',
				dataType: 'json',
				success: function(data){
					ethApp.balance.address = address;
					ethApp.balance.balance = data + " ETH";
				}
			});
		});
		
		$("#blockButton").click(function(){
			$.ajax({
				url: 'web3/recentBlock',
				type: 'POST',
				dataType: 'json',
				success: function(data){
					ethApp.block = data;
				}
			});
		});
	});
	
</script>