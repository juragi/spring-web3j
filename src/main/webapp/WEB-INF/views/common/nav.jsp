<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
	<a class="navbar-brand" href="/">Start Bootstrap</a>
	
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
			<c:if test="${sessionScope.email != null }">
				<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
					<a class="nav-link">
						<i class="fa fa-fw fa-lock"></i>
						<span class="nav-link-text">${sessionScope.email }</span>
					</a>
				</li>
			</c:if>
			
			
			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
				<a class="nav-link" href="charts.html">
					<i class="fa fa-fw fa-area-chart"></i>
					<span class="nav-link-text">Charts</span>
				</a>
			</li>

			<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
				<a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
					<i class="fa fa-fw fa-wrench"></i>
					<span class="nav-link-text">Components</span>
				</a>
				<ul class="sidenav-second-level collapse" id="collapseComponents">
					<li>
						<a href="navbar.html">Navbar</a>
					</li>
					<li>
						<a href="cards.html">Cards</a>
					</li>
				</ul>
			</li>
      </ul>
		<ul class="navbar-nav sidenav-toggler">
			<li class="nav-item">
				<a class="nav-link text-center" id="sidenavToggler">
					<i class="fa fa-fw fa-angle-left"></i>
				</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fa fa-fw fa-envelope"></i>
					<span class="d-lg-none">Messages
						<span class="badge badge-pill badge-primary">12 New</span>
					</span>
					<span class="indicator text-primary d-none d-lg-block">
						<i class="fa fa-fw fa-circle"></i>
					</span>
				</a>
				<div class="dropdown-menu" aria-labelledby="messagesDropdown">
					<h6 class="dropdown-header">New Messages:</h6>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">
						<strong>David Miller</strong>
						<span class="small float-right text-muted">11:21 AM</span>
						<div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">
						<strong>Jane Smith</strong>
						<span class="small float-right text-muted">11:21 AM</span>
						<div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">
						<strong>John Doe</strong>
 						<span class="small float-right text-muted">11:21 AM</span>
						<div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item small" href="#">View all messages</a>
				</div>
			</li>
        	
			<li class="nav-item">
				<form class="form-inline my-2 my-lg-0 mr-lg-2">
					<div class="input-group">
						<input class="form-control" type="text" placeholder="Search for...">
						<span class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>
			</li>
			<li class="nav-item">
				<c:if test="${sessionScope.email != null }">
					<a class="nav-link" id='logout' onclick="$.post('logout').done(function(){location.href='/'});">
					<i class="fa fa-fw fa-sign-out"></i>Logout</a>
				</c:if>
				<c:if test="${sessionScope.email == null }">
					<a class="nav-link" href='login'>
					<i class="fa fa-fw fa-sign-out"></i>Login/Register</a>
				</c:if>
			</li>
		</ul>
	</div>
</nav>