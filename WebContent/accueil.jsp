<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
        <head>
			<meta http-equiv="Content-Type" content"text/html;charset=UTF-8">
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />	
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style_accueil.css"/>" />
			<title>Welcome to #Jumper</title>
		</head>
        
        <body>
			<header>
			<!--le header contient le nom de l'application et le nom d'utilisateur, il reste statique une fois qu'il a charg� le nom et photo de l'utilisateur-->
				<h2>#Jumper</h2>
					<div id="user_name">
						<p>Pauline</p>
					</div>
					<img src="<c:url value="/img/user_img.png"/>"/>
			
			</header>
			<!--Les section, c'est la partie coeur, c'est la ou on doit developp� les differents fonctionnalit� -->
			<section>
				<ul id="menu_horizontal">
						<li>15 tags</li>
						<li>35 favoris</li>
						<li>2 favoris à trier</li>
				</ul>
				<div id="content_page">
					
					<h1>Bienvenue</h1>
					<table> <!-- Corps du tableau -->
						<tr>
							<td>
									<img src="<c:url value="/img/apercu_site/ent.png"/>"/>
									<p>Ent</p>
							</td>
						    <td>
									<img src="<c:url value="/img/apercu_site/deezer.jpg"/>"/>
									<p>Deezer</p>
							</td>	
						    <td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
						    </td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
					    </tr>
					    <tr>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
							<td>
									<img src="<c:url value="/img/apercu_site/allocine.png"/>"/>
									<p>Allocine</p>
							</td>
					    </tr>
					</table>
					
				</div>
				<!-- implement� votre code ici -->
			
			</section>
			<!--Si votre page contient une tab (ex: liste des tags), penser a utiliser la balise <aside>, elle fait pour ce genre de fonctionnalit�-->
			<footer>
			<!-- c'est un exemple de footer, on peux le changer plus tards -->
				<p>Copyright</p>
			</footer>
        </body>
        
</html>