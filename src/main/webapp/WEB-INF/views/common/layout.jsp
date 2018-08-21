<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>SB Admin - Start Bootstrap Template</title>
	<base href="${pageContext.servletContext.contextPath }/">
	<!-- Bootstrap core CSS-->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom fonts for this template-->
	<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- Page level plugin CSS-->
	<link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
	<!-- Custom styles for this template-->
	<link href="css/sb-admin.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<tiles:insertAttribute name="head" ignore="true" />
	<div class="content-wrapper">
		<div class="container-fluid">
			<script src="vendor/jquery/jquery.min.js"></script>
			
			<tiles:insertAttribute name="center"/>
			
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- Core plugin JavaScript-->
			<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
			<!-- Page level plugin JavaScript-->
			<script src="vendor/chart.js/Chart.min.js"></script>
			<script src="vendor/datatables/jquery.dataTables.js"></script>
			<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
			<!-- Custom scripts for all pages-->
			<script src="js/sb-admin.min.js"></script>
			<!-- Custom scripts for this page-->
			<script src="js/sb-admin-datatables.min.js"></script>
		</div>
	</div>
	<%-- <tiles:insertAttribute name="footer" ignore="true" /> --%>
</body>
</html>