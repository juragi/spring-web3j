<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<P>  The time on the server is ${serverTime}. </P>

<div id="ethApp">
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
		<hr/>
		
	</form>
	
	<form id="txForm">
		<div class="form-row">
			<div class="col-8">
				<input type="text" name="txid" placeholder="txid" class="form-control"/>
			</div>
			<div class="col-auto">
				<button type="submit" id="txButton" class="btn btn-sm btn-primary">check</button>
			</div>
		</div>
		<div id="txResult">
			<div>txid: {{ txid }}</div>
			<div>from address: {{ from }}</div>
			<div>to address: {{ to }}</div>
			<div>amount: {{ amount }} </div>
		</div>
	</form>
</div>
<script>
	var web3 = new Web3(new Web3.providers.HttpProvider("https://mainnet.infura.io/f7lCFyNhcZYorDJ17vYD"));
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
				console.log(data);
				ethApp.from = data.from;
				ethApp.to = data.to;
				ethApp.txid = data.hash;
				ethApp.amount = web3.fromWei(data.value, 'ether') + " ETH";
			}, 'json')
		})
	});
	
	var ethApp = new Vue({
		el: "#ethApp",
		data: {
			fileName: "", 
			address: "",
			txid: "",
			to: "",
			from: "",
			amount: ""
		},
		methods: {
			newWallet: function(fileName, address) {
				this.fileName = fileName;
				this.address = address;
			}
		}
	});
	
</script>