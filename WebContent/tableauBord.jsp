<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html >
<html>
        <head>
			<meta http-equiv="Content-Type" content"text/html;charset=UTF-8">
			
			<link rel="stylesheet" href="<c:url value="/css/bootstrap/css/bootstrap.min.css"/>" />
			
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />	
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style_tableau_bord.css"/>" />
			<title>Tableau de bord</title>
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
				
				
					<div class="row">
  
  
  					
    				
    				

					<c:forEach items="${mainMenu}" var="myMenu">
					    tag : ${myMenu.key}  <br>
					    <c:forEach items="${myMenu.value}" var="item" varStatus="loop">
					         site : ${item} <br>
					    </c:forEach>                                            
					    
					</c:forEach>
					
					
				</div>
				</div>
			
			</section>
			<!--Si votre page contient une tab (ex: liste des tags), penser a utiliser la balise <aside>, elle fait pour ce genre de fonctionnalit�-->
			<footer>
			<!-- c'est un exemple de footer, on peux le changer plus tards -->
				<p>Copyright</p>
			</footer>
        </body>
        
</html>