<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="dao.*" %>
<% String name_page = (String) request.getAttribute("page"); %>
<% String css = (String) request.getAttribute("css"); %>
<% User user = (User) session.getAttribute("user"); %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Projet NF28</title>
		<style type="text/css">
			<%= css %>
		</style>
	</head>
	<body>
		<div id="page">
			<div id="header">
				<div id="banner">
					<span>Projet NF28</span>
				</div>
				<div id="menu">
					<span>
						<a href="?page=index">Index</a>
					</span>
				</div>
			</div>
			<div>
				<%
					String main_message = (String)request.getAttribute("main_message");
					if (main_message != null) {
				%>
				<div id="notification">
					<%= main_message %>
				</div>
				<% } %>
			</div>
			<div id='content'>
				<jsp:include page="<%= name_page %>"/>
			</div>
			
			<div id='footer'>
				<span>nf28</span>
			</div>
		</div>
	</body>
</html>