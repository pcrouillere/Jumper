<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en-US">
<head>

	<meta charset="utf-8">

	<title>Login</title>
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">
</head>

<body>

	<div id="login">
		<table>
		<h2><span class="fontawesome-lock2">Inscription ! </span></h2>
		<form action="?page=inscription" method="POST">

			<fieldset>
				<p><label for="name">Nom d'utilisateur</label></p>
				<p><input type="name" name="name" id="name" value="Nom" onBlur="if(this.value=='')this.value='Nom'" onFocus="if(this.value=='Nom')this.value=''"></p>

				<p><label for="email">E-mail</label></p>
				<p><input type="email" name="email" id="email" value="mail@address.com" onBlur="if(this.value=='')this.value='mail@address.com'" onFocus="if(this.value=='mail@address.com')this.value=''"></p>

				<p><label for="password">Mot De Passe</label></p>
				<p><input type="password" name="password" id="password" value="password" onBlur="if(this.value=='')this.value='password'" onFocus="if(this.value=='password')this.value=''"></p>

				<p><input type="submit" value="Inscription"></p>

			</fieldset>

		</form>
		


	</div> <!-- end login -->

</body>	
</html>