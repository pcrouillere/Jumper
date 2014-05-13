<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
        <head>
			<meta http-equiv="Content-Type" content"text/html;charset=UTF-8">
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />	
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style_ajoutTag.css"/>" />	
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
			<!--Les section, c'est la partie coeur, c'est la ou on doit developper les differentes fonctionnalit�es -->
			<section>
				<div id="content_page">
					<h1>Ajouter un tags</h1>
					<table> <!-- Corps du tableau -->
						<tr>
							<td>
								<img src="<c:url value="/img/apercu_site/ent.png"/>" ondrop="drop(event)" ondragover="allowDrop(event)" id="1" />
								<p>Ent</p>
							</td>
						    <td>
								<img src="<c:url value="/img/apercu_site/deezer.jpg"/>"  ondrop="drop(event)" ondragover="allowDrop(event)" id="2"/>
								<p>Deezer</p>
							</td>	
						    <td>
								<img src="<c:url value="/img/apercu_site/allocine.png"/>"  ondrop="drop(event)" ondragover="allowDrop(event)" id="3"/>
								<p>Allocine</p>
						    </td>
					    </tr>
					    <tr>
							<td>
								<img src="<c:url value="/img/apercu_site/allocine.png"/>"  ondrop="drop(event)" ondragover="allowDrop(event)" id="4"/>
								<p>Allocine</p>
							</td>
					    </tr>
					</table>
					
				</div>
				<aside>
					<div id="tag_list">
						<h2>Liste des tags</h2>
						<div id="tag_names"/>
						</div>
						<div id="input_tag">
							<label for="tag_name">nom du tag</label>
							<input type="text" id="tag_name" size="14">
						</div>
					</div>
					<script language="javascript" type="text/javascript">
						//Create new tag in the list
						var element= document.getElementById("tag_name");
						element.addEventListener('keypress',function(e){
							//ajouter les tags dans la tag_list
							if(element.value!="")
							{
								//check if the user has pressed enter
								var key = e.which || e.keycode;
								if(key==13)
								{
									var span=document.createElement('p');
									span.draggable="true";
									span.ondragstart="drag(event)";
									var newlinktext=document.createTextNode("#"+element.value);
									span.appendChild(newlinktext);
									var tag_names= document.getElementById("tag_names");
									tag_names.appendChild(span);
									element.value="";
								}
							}
						},false);
						
						//Drag n drop option over tags names
						function allowDrop(ev)
						{
							ev.preventDefault();
						}

						function drag(ev)
						{
							ev.dataTransfer.setData("tag_names",ev.target.id);
						}

						function drop(ev)
						{
							//get the target id
							var targetToRemove=document.getElementsByTagName('td')[ev.target.id-1];
							ev.preventDefault();
							//remove the target
							targetToRemove.parentNode.removeChild(targetToRemove);
						}
					</script>
				</aside>			
			</section>
			<footer>
			<!-- c'est un exemple de footer, on peux le changer plus tard -->
				<p>Copyright</p>
			</footer>
        </body>
        
</html>