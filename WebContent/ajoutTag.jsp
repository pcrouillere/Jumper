<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
        <head>
			<meta http-equiv="Content-Type" content"text/html;charset=UTF-8">
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css"/>" />	
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style_ajoutTag.css"/>" />	
			<link type="text/css" rel="stylesheet" href="<c:url value="/css/style_accueil.css"/>" />
			<link rel="stylesheet" href="<c:url value="/css/bootstrap/css/bootstrap.min.css"/>" />
			<link rel="stylesheet" href="<c:url value="/css/bootstrap/css/bootstrap-theme.min.css"/>"/>
			<script type="text/javascript" src="<c:url value="/css/bootstrap/js/bootstrap.min.js"/>"></script>
			<title>Add tags page</title>
		</head>
        <body>
			<header>
			<!--le header contient le nom de l'application et le nom d'utilisateur, il reste statique une fois qu'il a chargé le nom et photo de l'utilisateur-->
				<h2>#Jumper</h2>
					<div id="user_name">
						<p>Pauline</p>
					</div>
					<img src="<c:url value="/img/user_img.png"/>"/>	
			</header>
			<!--Les section, c'est la partie coeur, c'est la ou on doit developper les differentes fonctionnalitées -->
			<section>
				<div id="content_page">
					<div class="head_content_page">
						<h1>Ajouter un tags</h1>
						<div id="how_to_do">
								<div class="alert alert-info"><p>Drop all tags you want over the link</p></div>
						</div>
					</div>
					<span class="all_links">
						<div class="row" id="link_1">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<img src="<c:url value="/img/apercu_site/ent.png"/>" ondrop="drop(event)" ondragover="allowDrop(event)" id="1" class="img-thumbnail"/>
									<div class="caption">
										<p>ENT</p>
										<p><a href="#" class="btn btn-primary" role="button" id="1"  onclick="done_callback(event)">Done</a></p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row" id="link_2">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<img src="<c:url value="/img/apercu_site/deezer.jpg"/>" ondrop="drop(event)" ondragover="allowDrop(event)" id="2" class="img-thumbnail"/>
									<div class="caption">
										<p>Deezer</p>
										<p><a href="#" class="btn btn-primary" role="button" id="2"  onclick="done_callback(event)">Done</a></p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row" id="link_3">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<img src="<c:url value="/img/apercu_site/deezer.jpg"/>" ondrop="drop(event)" ondragover="allowDrop(event)" id ="3" class="img-thumbnail"/>
									<div class="caption">
										<p>Allocine</p>
										<p><a href="#" class="btn btn-primary" role="button" id="3" onclick="done_callback(event)">Done</a></p>
									</div>
								</div>
							</div>
						</div>
					</span>
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
						var count=1;
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
							alert(ev.target.id);
							var targetToRemove=document.getElementsById('row')[ev.target.id-1];
							ev.preventDefault();
							//remove the target
							targetToRemove.parentNode.removeChild(targetToRemove);
						}
						
						function done_callback(ev)
						{
							var ele="link_"+ev.target.id;
							var targetToRemove=document.getElementById(ele);
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