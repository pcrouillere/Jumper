<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="dao.*" %>
<% String name_page = (String) request.getAttribute("page"); %>
<% String css = (String) request.getAttribute("css"); %>
<% User user = (User) session.getAttribute("user"); %>
<html>
        <head>
			<meta http-equiv="Content-Type" content"text/html;charset=UTF-8">
			<style type="text/css">
				<%= css %>
			</style>
			<title>Welcome to #Jumper</title>
		</head>
	        <body>
			<header>
				<h2>#Jumper</h2>
					<div id="user_name">
						<p>Pauline</p>
					</div>
			</header>
		<div id="page">
			<div>
				<%
					String main_message = (String)request.getAttribute("main_message");
					if (main_message != null) {
				%>
				<% } %>
			</div>
			<div id='content'>
				<jsp:include page="<%= name_page %>"/>
			</div>
			
			<footer>
				<p>Copyright Crouillère Pauline, Cuche Pauline, Chen Yiyan, Saadi Mourad</p>
			</footer>
		</div>
	</body>
</html>