<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List, java.util.Date, java.util.Vector"  %>

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
						<h1>Ajouter des tags</h1>
						<div id="how_to_do">
								<div class="alert alert-info"><p>Drop all tags you want over the link</p></div>
						</div>
					</div>				
					<div id="all_links">
					<!-- This part should be loaded from Database, this is just an exemple -->
						<% 
							Vector<String> imgList=new Vector<String>();
							Vector<String> pBalise=new Vector<String>();
							int i=0;
							imgList.add("/img/apercu_site/ent.png");
							imgList.add("/img/apercu_site/deezer.jpg");
							imgList.add("/img/apercu_site/allocine.png");
							pBalise.add("ENT");
							pBalise.add("Deezer");
							pBalise.add("Allocine");
							imgList.add("/img/apercu_site/ent.png");
							imgList.add("/img/apercu_site/deezer.jpg");
							imgList.add("/img/apercu_site/allocine.png");
							pBalise.add("ENT");
							pBalise.add("Deezer");
							pBalise.add("Allocine");
							while ( i<imgList.size())
							{
						%>
							<div class="row" id="<%="link_"+String.valueOf(i+1)%>">
								<div class="col-sm-6 col-md-4">
									<div class="thumbnail">
										<img src="<c:url value="<%= imgList.get(i) %>"/>" ondrop="drop(event)" ondragover="allowDrop(event)" id="<%=String.valueOf(i+1)%>" class="img-thumbnail"/>
										<div class="caption">
											<p><%= pBalise.get(i)%></p>
											<p><a href="#" class="btn btn-primary" role="button" id="<%=String.valueOf(i+1)%>"  onclick="done_callback(event)">Done</a></p>
										</div>
									</div>
								</div>
							</div>
						<% 
								i++;
							}
						%>
					</div>
				</div>
				<aside>
					<div id="tag_list">
						<div class="panel panel-default">
							  <div class="panel-heading">
							    <h3 class="panel-title">Liste des tags</h3>
							  </div>
							    <div class="panel-body" style="height:283px;">
									<div id="tag_names"/>									
										<!-- Load all tag names from the database here -->							
									</div>
								</div>
							</div>
						<div id="input_tag">
							<div class="input-group">
							  <span class="input-group-addon">Add tags</span>
							  <input type="text" class="form-control" placeholder="Tag name" id="tag_name">
							</div>
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
				<p><%="last check "+new Date().toLocaleString() %></p>
				<p>Copyright</p>
			</footer>
        </body>
        
</html>