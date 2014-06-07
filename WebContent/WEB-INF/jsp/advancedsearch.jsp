
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="dao.*,java.util.List, java.util.Map, java.util.Set,java.util.Iterator "%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
	List<Url> urls = (List<Url>) request.getAttribute("urls");
	Integer nbTags = (Integer) request.getAttribute("nbTags");
	Integer nbUrls = (Integer) request.getAttribute("nbUrls");
	Integer nbUntaggedUrls = (Integer) request.getAttribute("nbUntaggedUrls");
    Map<Tag, List<Url>> mapTagUrls = (Map<Tag, List<Url>>) request.getAttribute("mapTagUrls");
%>





<html>
  <head>
    <style>
      body {
        margin: 0px;
        padding: 0px;
      }
    </style>
  </head>
  <body>
<div style="position: relative;">
  <canvas id="tempCanvas" width="500" height="500" style="display:none;"></canvas>
  <canvas id="layer2" width="500" height="500" 
   style="position: absolute; left: 1000px; top: 0px; z-index: 0;"></canvas>
  <canvas id="layer3" width="500" height="500" 
   style="position: absolute; left: 1000px; top: 0px; z-index: 1;"></canvas>
  <canvas id="layer1" width="500" height="500" 
   style="position: absolute; left: 1000px; top: 0px; z-index: 2;"></canvas>
  <div id="container"  style="position: absolute; left: 1000px; top: 0px; z-index: 4;"></div>
  <canvas id="trush"  width="500" height="500" 
   style="position: absolute; left:1000px ; top:0px; z-index: 3;"></canvas>
  </div>
     <script  type="text/javascript" src="http://d3lp1msu2r81bx.cloudfront.net/kjs/js/lib/kinetic-v5.0.2.min.js"></script>
   	 <script  type="text/javascript" defer="defer">

   					var selectedpiece= [];
   					var ovals = [];

   					function addoval(ovals,selectedpiece,oval){
   						ovals.push(oval); 
   						for(i in selectedpiece){
   							selectedpiece[i].push(false);
   						}
   					}

   					function deleteoval(ovals,selectedpiece,i){
   						ovals.splice(i, 1);
   						for(j in selectedpiece){
   							selectedpiece[j].splice(i, 1);
   							if(selectedpiece[j].length==0)
   								selectedpiece.splice(j, 1);
   						}
   					}
   					
   					function deleteovalbytag(ovals,selectedpiece,tag){
   						var j=-1;
   						for(i in ovals){
   						
   							if(ovals[i].gettag()==tag){
   								j=i;
   							}
   						}
   						if(j!=-1)
   							deleteoval(ovals,selectedpiece,j);
   					}


   					function allpiecestostring(ovals, selectedpiece){
   						var request; 
   						request="{";
   						for(i in selectedpiece){
   							request+="[";
   							for(j in selectedpiece[i]){
   								if(selectedpiece[i][j]){
   									var taginrequest=ovals[j].tag.replace('#','');
   									request+=("("+taginrequest+")");
   								}	
   								else {
   									var taginrequest=ovals[j].tag.replace('#','');
   									request+=("(!"+taginrequest+")");
   								}
   									
   							}
   							request+="]";
   						}
   						request+="}";
   						return request;
   					}

   					      var canvas = document.getElementById('layer1');
   					      var context = canvas.getContext('2d');
   					      var canvas2 = document.getElementById('layer2');
   					      var context2 = canvas2.getContext('2d');
   					      var canvas3 = document.getElementById('layer3');
   					      var context3 = canvas3.getContext('2d');
   					      var canvas4 = document.getElementById('trush');
   					      var context4 = canvas4.getContext('2d');
   					      
   					      
   					      
   						  var stage = new Kinetic.Stage({
   						      container: 'container',
   						      width: 500,
   						      height: 500
   						  });
   						  
   						  
   						  var layer = new Kinetic.Layer();
   						     var backgroud = new Kinetic.Rect({
   					        x: 0,
   					        y: 0,
   					        width: stage.width(),
   					        height: stage.height(),
   					        fill: 'green',
   							opacity:0
   					      });
   						  layer.add(backgroud);
   					     backgroud.draggable(false);
   					     var text = new Kinetic.Text({
   					        x: 10,
   					        y: 10,
   					        fontFamily: 'Calibri',
   					        fontSize: 11,
   					        text: '',
   					        fill: 'black'
   					      });
   					      layer.add(text);




   					function Tagoval(tag,x_por,y_por,rot,rw_por,hw_ratio) {
   					  this.selected=false;
   					  this.mouseon=false;
   					  this.tag=tag;
   					  this.x_por=x_por;
   					  this.y_por=y_por;
   					  this.rot=rot;
   					  this.rw_por=rw_por;
   					  this.hw_ratio=hw_ratio;
   					}

   					Tagoval.prototype = {
   					  getFocs: function(){
   								var a=Math.max(this.rw_por,this.rw_por*this.hw_ratio);
   								var b=Math.min(this.rw_por,this.rw_por*this.hw_ratio);
   							    var c=Math.sqrt(a*a-b*b);
   								var foc1={x:this.x_por,y:this.y_por};
   								var foc2={x:this.x_por,y:this.y_por};
   								foc1.x+=c*Math.cos(this.rot);
   							    foc1.y+=c*Math.sin(this.rot);
   								foc2.x-=c*Math.cos(this.rot);
   							    foc2.y-=c*Math.sin(this.rot);
   								return [foc1,foc2];
   							  }
   						,
   						update: function (newx, newy){
   									this.x_por=newx;
   									this.y_por=newy;
   									drawovals(ovals, document.getElementById('layer1'));
   									
   									drawallpieces(selectedpiece,ovals,canvas3);
   							  }
   						,
   						gettag: function (){return this.tag;}
   					};





   					function writeMessage(canvas, message) {
   					        var context = canvas.getContext('2d');
   					        context.clearRect(0, 0, canvas.width/2, canvas.height/10);
   					        context.font = '18pt Calibri';
   					        context.fillStyle = 'black';
   					        context.fillText(message, 10, 25);
   					      }
   					      function getMousePos(canvas, evt) {
   					        var rect = canvas.getBoundingClientRect();
   					        return {
   					          x: evt.clientX - rect.left,
   					          y: evt.clientY - rect.top
   					        };
   					      }
   					     
   					   
   					   
   					   function pieceIdentic(piece1,piece2){
   							if(piece1.length==piece2.length){
   								var identic=true;
   								for(var i in piece1){
   									identic=(piece1[i]==piece2[i])&&identic;
   								}
   								return identic;
   							}
   							else
   							return false;
   					   }
   					     function addpiece(selectedpiece,piece){
   							var repeated = false; 
   							for(var i in selectedpiece){
   								if(pieceIdentic(selectedpiece[i],piece))
   									repeated=true;
   							}
   							if(!repeated){
   								selectedpiece.push(piece);
   							}
   							return repeated;
   					     }
   					   
   							function drawpiece2(piece,ovals,canvas){
   								if(piece.length=ovals.length){
   									for(var i in piece){
   										ovals[i].mouseon=piece[i];
   									}
   									drawpiece(ovals,canvas,'red');
   								}
   								
   							}
   							
   							function convertCanvasToImage(canvas) {
   							var image = new Image();
   							image.src = canvas.toDataURL("image/png");
   							return image;
   					}
   							function drawallpieces(selectedpiece,ovals,canvass){
   								   var tempCanvas = document.getElementById('tempCanvas');
   								   var tempContext = tempCanvas.getContext('2d');
   								   var contexts = canvass.getContext('2d');
   								   tempContext.clearRect(0, 0, tempCanvas.width, tempCanvas.height);
   								   contexts.clearRect(0, 0, canvass.width, canvass.height);
   								   // add the layer to the stage
   								    var layer = new Kinetic.Layer();
   								   for(var i in selectedpiece){
   									  drawpiece2(selectedpiece[i],ovals,tempCanvas);
   									  contexts.drawImage(tempCanvas,0,0);
   								   }   
   							}
   							
   							function deletepiece(selectedpiece,piece){
   								for(var i = selectedpiece.length - 1; i >= 0; i--) {
   									if(pieceIdentic(selectedpiece[i],piece)) {
   										selectedpiece.splice(i, 1);
   									}
   								}
   							}

   						  function isInside(point,oval){
   							return (Math.sqrt((Math.pow((oval.getFocs()[0].x-point.x),2)+
   							Math.pow((oval.getFocs()[0].y-point.y),2)))
   							+
   							Math.sqrt((Math.pow((oval.getFocs()[1].x-point.x),2)+
   							Math.pow((oval.getFocs()[1].y-point.y),2)))<2*Math.max(oval.rw_por,oval.rw_por*oval.hw_ratio));
   						  }
   						  
   						 
   						 
   						  
   						  function drawovals(ovals, canvas) {
   						      var context = canvas.getContext('2d');
   							  context.clearRect(0, 0, canvas.width, canvas.height);
   						      for (var i in ovals) {
   							     
   						          context.save();
   						          var centerX = canvas.width * ovals[i].x_por;
   						          var centerY = canvas.height * ovals[i].y_por;
   								  context.translate(centerX,centerY);
   						          context.rotate(ovals[i].rot);
   						          context.scale(1, ovals[i].hw_ratio);
   						          context.beginPath();
   						          context.arc(0, 0, ovals[i].rw_por * canvas.width, 0, 2 * Math.PI, false);
   						          context.closePath();
   						          context.restore();
   						          context.lineWidth = 5;
   						          context.strokeStyle = 'black';
   						          context.stroke();
   								  context.restore();
   						      }
   						  }

   						  
   						  	function drawandfill(oval, canvas,color) {
   							  color = typeof color !== 'undefined' ? color : 'red';
   						      var context = canvas.getContext('2d');
   					              context.save();
   						          var centerX = canvas.width * oval.x_por;
   						          var centerY = canvas.height * oval.y_por;
   								  context.translate(centerX,centerY);
   						          context.rotate(oval.rot);
   						          context.scale(1, oval.hw_ratio);
   						          context.beginPath();
   						          context.arc(0, 0, oval.rw_por * canvas.width, 0, 2 * Math.PI, false);
   								  context.fillStyle = color;
   								  context.fill();
   								  context.restore();
   						  }
   						  
   						   function drawpiece(ovals,canvas,color){
   						   color = typeof color !== 'undefined' ? color : 'red';
   						      
   						    context=canvas.getContext('2d');
   							context.save();
   							context.clearRect(0, 0, canvas.width, canvas.height);
   						
   						
   							for(var i in ovals){
   								if(ovals[i].mouseon==true){
   									drawandfill(ovals[i], canvas,color); 
   									context.globalCompositeOperation='destination-in';
   								}
   							}
   						    
   							context.beginPath();
   					        context.rect(0, 0,canvas.width, canvas.height);
   					        context.fillStyle = color;
   					        context.fill();
   							
   							
   							for(var i in ovals){
   								if(ovals[i].mouseon!=true){
   									context.globalCompositeOperation='destination-out';
   									drawandfill(ovals[i], canvas,color);
   								}
   							}
   						
   							context.restore();
   						}

   						  function writeMessagedyn(message) {
   					        text.setText(message);
   					        layer.draw();
   					      }

   					function drawdynoval(oval,layer,stage,width,height){

   						var group = new Kinetic.Group({
   							draggable: true,
   							
   						});
   						group.model=oval;
   					    group.x(oval.x_por*width);
   						group.y(oval.y_por*height);

   					    var text = new Kinetic.Text({
   					        x:oval.rw_por*width*Math.cos(oval.rot),
   					        y:oval.rw_por*width*Math.sin(oval.rot),
   					        fontFamily: 'Calibri',
   					        fontSize: 24,
   					        text: oval.tag,
   					        fill: 'black'
   					      });
   						  
   						  text.draggable(true);
   						  
   						  
   						  text.on('dragend', function() {
   						  	if(text.x()+group.x()>450 && text.y()+group.y()>450){
   						  		group.remove(); 
   						  		alert(text.getAttr("text"));
   						  		deleteovalbytag(ovals,selectedpiece,text.getAttr("text"));
   						  		drawovals(ovals, document.getElementById('layer1'));
   								drawallpieces(selectedpiece,ovals,canvas3);
   								writeMessagedyn(allpiecestostring(ovals,selectedpiece));
   								layer.draw();
   						  	};
   					      });
   						  
   						  var ovalshape = new Kinetic.Shape({
   						      sceneFunc: function (context) {
   						          context.beginPath();
   						          context.save();
   						          context.rotate(oval.rot);
   						          context.scale(1, oval.hw_ratio);
   						          context.arc(0, 0, oval.rw_por*width, 0, 2 * Math.PI, !1);
   						          context.restore();
   						          context.closePath();
   						          // KineticJS specific context method
   						          context.fillStrokeShape(this);
   						      },
   						      x: 0,
   						      y: 0,
   						      stroke: 'blue',
   						      strokeWidth: 4
   						  });
   						  //ovalshape.draggable(true);
   						  
   						  group.on('mouseover', function () {
   						      document.body.style.cursor = 'pointer';
   						  });
   						  group.on('mouseout', function () {
   						      document.body.style.cursor = 'default';
   						  });
   					      group.on('dragend', function() {
   						      this.model.update(this.x()/width,this.y()/height);
   					      });
   						  group.add(text);
   						  group.add(ovalshape);
   						  layer.add(group);
   						}
   						
   						function drawalldynoval(ovals,layer,stage){
   							  
   							
   							for(i in ovals){
   								drawdynoval(ovals[i],layer,stage,stage.width(),stage.height());
   							}
   						
   						}
   						
   						   layer.on('click', function(){
   								 var canvas3 = document.getElementById('layer3');
   					        var context3 = canvas3.getContext('2d');
   							
   								var mousePos = stage.getPointerPosition();
   								//context3.save();
   								
   								var piece=[];
   								for(var i in ovals){
   									if(isInside({x:mousePos.x/canvas3.width,y:mousePos.y/canvas3.height},ovals[i])){
   										piece.push(true);
   									}
   									else{
   										piece.push(false);
   									}
   								}
   								if(addpiece(selectedpiece,piece)){
   									deletepiece(selectedpiece,piece);
   								}
   							
   								drawallpieces(selectedpiece,ovals,canvas3);
   								//context3.restore();
   								writeMessagedyn(allpiecestostring(ovals,selectedpiece));
   								
   								});
   								
   						  stage.add(layer);
   							
   						  layer.on('mousemove', function(){
   							var mousePos = stage.getPointerPosition();
   					        var message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y;
   							//writeMessagedyn(message);
   							context2.save();
   							context2.clearRect(0, 0, canvas2.width, canvas2.height); 
   							for(var i in ovals){
   								if(isInside({x:mousePos.x/canvas2.width,y:mousePos.y/canvas2.height},ovals[i])){
   									ovals[i].mouseon=true; 
   								}
   								else{
   									ovals[i].mouseon=false;
   								}
   							}
   							drawpiece(ovals,canvas2,'#F5F5F5');
   					        context2.restore();
   					      }, false);
   					      
   					var img = new Image();
   					img.onload = function() { context4.drawImage(img,450, 450,50,50);};
   					img.src = 'icones/trush.png';
   					layer.draw();
   					 </script>
					
					
					<script>
					function searchTag(){
						var req = allpiecestostring(ovals,selectedpiece);
						if (window.XMLHttpRequest) { 
							xhr_obj = new XMLHttpRequest(); 
						}
						else if (window.ActiveXObject) { 
							xhr_obj = new ActiveXObject("Microsoft.XMLHTTP"); 
						}	
						if (!xhr_obj) { 
							alert('Abandon :Impossible de créer une instance XMLHTTP'); 
							return false; 
						} 
						xhr_obj.onreadystatechange = function() {
							if (xhr_obj.readyState == 4 && xhr_obj.responseText) {
									var result = xhr_obj.responseText;
									var listUrls = result.split(' $$$ ');
									var textResult = '';
									for(i in listUrls){
										textResult+="<br>";
										textResult+="<a href=\""+listUrls[i]+"\">Visit W3Schools</a>";
										textResult+="</br>";
									}
									console.log( textResult); 
									document.getElementById('urls').innerHTML = textResult;
							}
						};
						xhr_obj.open('GET', 'http://localhost:8080/Jump/advancedsearch?req='+req, true);
						xhr_obj.send(null);
					}
					</script>
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
		<form name="search" onsubmit="searchTag()">
			<fieldset>
				<p><input type="button" name ="Jump" value="Jump" onclick="searchTag()"></p>
			</fieldset>
		</form>
       <div id="urls">
	
	  </div>
							
							
							
							
							
							
							
							<div class="input-group">
							  <p><a href="#" class="btn btn-primary" role="button" id="done"  onclick="done_callback(event)">Done</a></p>
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
									var ovalnew=new Tagoval("#"+element.value,0.5,0.5,Math.PI/3,0.2,0.5);
									addoval(ovals,selectedpiece,ovalnew);
									drawdynoval(ovalnew,layer,stage,stage.width(),stage.height());
									drawovals(ovals, document.getElementById('layer1'));
									drawallpieces(selectedpiece,ovals,canvas3);
									writeMessagedyn(allpiecestostring(ovals,selectedpiece));
									
									layer.draw();
									element.value="";
								}
							}
						},false);
						

					</script>
  </body>
</html>