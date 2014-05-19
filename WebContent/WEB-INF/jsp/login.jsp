<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en-US">
<head>

	<meta charset="utf-8">

	<title>Login</title>
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">
	<link type="text/css" rel="stylesheet" href="<c:url value="/css/style_login.css"/>" />	

	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

</head>

<body>

	<div id="login">

		<h2><span class="fontawesome-lock"></span>Sign In</h2>

		<form action="?page=login" method="POST">

			<fieldset>

				<p><label for="email">E-mail</label></p>
				<p><input type="email" name="email" id="email" value="mail@address.com" onBlur="if(this.value=='')this.value='mail@address.com'" onFocus="if(this.value=='mail@address.com')this.value=''"></p> <!-- JS because of IE support; better: placeholder="mail@address.com" -->

				<p><label for="password">Mot De Passe</label></p>
				<p><input type="password" name="password" id="password" value="password" onBlur="if(this.value=='')this.value='password'" onFocus="if(this.value=='password')this.value=''"></p> <!-- JS because of IE support; better: placeholder="password" -->

				<p><input type="submit" value="Sign In"></p>

			</fieldset>

		</form>

	</div> <!-- end login -->

</body>	
</html>