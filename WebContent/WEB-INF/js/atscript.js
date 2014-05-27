//Create new tag in the list
var element= document.getElementById("tag_name");
var count=1;
var affectation=new Map;
$("#tag_name").submit(function(event){
	alert('submit');
});

element.addEventListener('keypress',function(e)
{
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
			span.id="1";
			var newlinktext=document.createTextNode(element.value);
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

function drag(ev,id)
{
	console.log("drag function value: "+id);
	ev.dataTransfer.setData("tag_names",id);
}

function drop(ev)
{
	//get the target id
	affectation.put(ev.target.id,ev.dataTransfer.getData("tag_names"));
	console.log("put key : "+ev.target.id);
	console.log("put value : "+ev.dataTransfer.getData("tag_names"));
}

function done_callback(ev)
{
	var ele="link_"+ev.target.id;
	var targetToRemove=document.getElementById(ele);
	targetToRemove.parentNode.removeChild(targetToRemove);
}
