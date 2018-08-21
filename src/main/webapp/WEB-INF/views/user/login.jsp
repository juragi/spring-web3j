<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- <form class="col-md-6" id="joinForm">
	<div class="form-group">
		<label for="name">name</label>
		<input class="form-control" type="text" name="name" placeholder="이름" required
		autocomplete="off"
		 pattern='.{1,10}' title='1~10자 입력'/>
	</div>
	<div class="form-group">
		<label for="id">id</label>
		<input class="form-control" type="text" name="id" placeholder="id" required
		autocomplete="off"
			pattern='[A-Za-z0-9]{4,15}' title='영어 or 숫자 4~15자 입력'/>
	</div>
	<div class="form-group">
		<label for="password">password</label>
		<input class="form-control" type="password" name="password" placeholder="password" required
			pattern='.{4,15}' title='4~15자 입력'/>
	</div>
	<div class="form-group">
		<label for="passcheck">passcheck</label>
		<input class="form-control" type="password" name="passcheck" placeholder="password check" 
			required pattern='.{4,15}' title='4~15자 입력'/>
	</div>
	<div class="form-group">
		<label for="phone">phone</label>
		<input class="form-control" type="text" name="phone" placeholder="phone number" required
		autocomplete="off"
			pattern='.{4,15}' title='4~15자 입력'/>
	</div>
	<button type="submit" class="btn btn-primary btn-block">Join</button>
</form> -->


<div class="row">
	<div class="col-md-6 center">
		<div class="panel panel-login">
			<div class="panel-heading">
				<div class="row">
					<div class="col-sm-6">
						<a href="#" class="active" id="login-form-link">Login</a>
					</div>
					<div class="col-sm-6">
						<a href="#" id="register-form-link">Register</a>
					</div>
				</div>
				<hr>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12">
					
						<form id="loginForm" role="form" style="display: block;">
							<div class="form-group">
								<input type="email" name="email" tabindex="1" class="form-control" placeholder="email" autocomplete="off" required>
							</div>
							<div class="form-group">
								<input type="password" name="password" tabindex="2" class="form-control" placeholder="password" required>
							</div>
							<!-- <div class="form-group text-center">
								<input type="checkbox" tabindex="3" class="" name="remember">
								<label for="remember"> Remember Me</label>
							</div> -->
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 center">
										<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
									</div>
								</div>
							</div>
							<!-- <div class="form-group">
								<div class="row">
									<div class="col-lg-12">
										<div class="text-center">
											<a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
										</div>
									</div>
								</div>
							</div> -->
						</form>
						
						<form id="registerForm" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
							<div class="form-group">
								<input type="text" name="name" tabindex="1" class="form-control" placeholder="Username" autocomplete="off">
							</div>
							<div class="form-group">
								<input type="email" name="email" tabindex="1" class="form-control" placeholder="Email Address" autocomplete="off">
							</div>
							<div class="form-group">
								<input type="password" name="password" tabindex="2" class="form-control" placeholder="Password">
							</div>
							<div class="form-group">
								<input type="password" name="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-sm-6 center">
										<input type="submit" name="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
									</div>
								</div>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
<script>
	$(function() {
	
	    $('#login-form-link').click(function(e) {
			$("#loginForm").delay(100).fadeIn(100);
	 		$("#registerForm").fadeOut(100);
			$('#register-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		$('#register-form-link').click(function(e) {
			$("#registerForm").delay(100).fadeIn(100);
	 		$("#loginForm").fadeOut(100);
			$('#login-form-link').removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
		});
		
		$("#registerForm").submit(function(event){
			event.preventDefault();
			var password = $(this).find("input[name=password]");
			var passcheck = $(this).find("input[name=confirm-password]");
			
			if($(password).val() != $(passcheck).val()){
				alert("password is incorrect");
				$(passcheck).focus();
				return;
			}
			
			var params = {};
			params.name = $(this).find("input[name=name]").val();
			params.email = $(this).find("input[name=email]").val();
			params.password = $(password).val();
			
			$.ajax({
				url: 'register',
				type: 'POST',
				data: JSON.stringify(params),
				contentType: "application/json; charset=utf8",
				dataType: 'json',
				success: function(data){
					if(data == 1) {
						alert("complete");
						location.href = '/';
					}else if(data == -1) {
						alert("already registered email");
					}
				}
			});
		});
		
		$("#loginForm").submit(function(event){
			event.preventDefault();
			var password = $(this).find("input[name=password]");
			var email = $(this).find("input[name=email]");
			
			var params = {
				email: $(email).val(),
				password: $(password).val()
			};
			
			$.ajax({
				url: 'login',
				type: 'POST',
				data: JSON.stringify(params),
				contentType: "application/json; charset=utf8",
				dataType: 'json',
				success: function(data){
					if(data == 1) {
						location.href = '/';
					}else if(data == -1) {
						alert("not registered email");
						$(email).focus();
					}else if(data == 0) {
						alert("wrong password");
						$(password).focus();
					}
				}
			});
		});
	});
</script>