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
		<td>
		<h2><span class="fontawesome-lock"></span>Se Connecter</h2>

		<form action="?page=login" method="POST">

			<fieldset>

				<p><label for="email">E-mail</label></p>
				<p><input type="email" name="email" id="email" value="mail@address.com" onBlur="if(this.value=='')this.value='mail@address.com'" onFocus="if(this.value=='mail@address.com')this.value=''"></p> <!-- JS because of IE support; better: placeholder="mail@address.com" -->

				<p><label for="password">Mot De Passe</label></p>
				<p><input type="password" name="password" id="password" value="password" onBlur="if(this.value=='')this.value='password'" onFocus="if(this.value=='password')this.value=''"></p> <!-- JS because of IE support; better: placeholder="password" -->

				<p><input type="submit" value="Connexion"></p>

			</fieldset>

		</form>
		
		</td>
		<td></td>
		<td>
		<h2><span class="fontawesome-lock"></span>Inscription</h2>

		<form action="?page=inscription" method="POST">

			<fieldset>

				<p><input type="submit" value="C'est parti ! "></p>

			</fieldset>

		</form>
		</td>
		</table>

	</div> <!-- end login -->

</body>	
</html>