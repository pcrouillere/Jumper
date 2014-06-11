<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="dao.*"%>
<%
	String name_page = (String) request.getAttribute("page");
%>
<%
	String css = (String) request.getAttribute("css");
%>
<%
	User user = (User) session.getAttribute("user");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<style type="text/css">
	<%=css%>
</style>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>

<title>Welcome to #Jumper</title>
</head>
<body>
	<header>
	<h2>#Jumper</h2>
	<%
		if (user != null) {
	%>
	<div id="user_name">
		<ul id="nav">
			<li><a href="#"><%=user.getuName() %></a>
				<ul>
					<li><a href="?page=accueil">Accueil</a></li>	
					<li><a href="?advancedsearch">Recherches</a></li>
					<li><a href="?page=tableaubord">Tableau De Bord</a></li>
					<li><a href="?page=graph">Graph View</a></li>
					<li><a href="?page=ajoutertag">Trier Nouveaux Favoris</a></li>
					<li><a href="?page=suggestion">Suggestion</a></li>
					<li><a href="?page=deconnexion">Deconnexion</a></li>
				</ul></li>
		</ul>
	</div>
	<%
		}
	%> </header>
	<div id="page">
		<div>
			<%
				String main_message = (String) request.getAttribute("main_message");
				if (main_message != null) {
			%>
			<%
				}
			%>
		</div>
		<div id='content'>
			<jsp:include page="<%=name_page%>" />
		</div>

		<footer>
		<p>Copyright</p>
		</footer>
	</div>
</body>
</html>