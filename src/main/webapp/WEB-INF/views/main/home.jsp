<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<P>  The time on the server is ${serverTime}. </P>

<form id="withdrawForm">
	<div>출금주소: <span id="withdrawAddress"></span></div>
	<div class="form-row">
		<select id="address">
			<option>test</option>
			<option>test2</option>
		</select>
		<div class="col-auto">
			<input type="text" name="amount" id="withdrawAmount" placeholder="출금금액" class="form-control"/>
		</div>
		<div class="col-auto">
			<button name="btn" type="submit" id="withdrawButton" class="btn btn-sm btn-primary">출금하기</button>
		</div>
		<div class="col-auto">
			<button id="maxButton" class="btn btn-sm btn-info">최대</button>
		</div>
		
	</div>
	
</form>