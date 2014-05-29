//Create new tag in the list
var tag_input = document.getElementById("tag_name");
var count=1;
var affectation=new Map;


tag_input.addEventListener('keypress',function(e)
{
	//ajouter les tags dans la tag_list
	if(this.value!="")
	{
		//check if the user has pressed enter
		var key = e.which || e.keycode;
		if(key==13)
		{
			var tag = document.createElement('p');
			tag.draggable="true";
			tag.id=this.value;
			tag.ondragstart = function(e){
				drag(e,this.id);
			};
			tag.innerHTML = "#"+this.value;
			var tag_names= document.getElementById("tag_names");
			tag_names.appendChild(tag);
			this.value="";
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
	var tagValue = ev.dataTransfer.getData("tag_names");
	affectation.put(ev.target.id,tagValue);
	console.log("put key : "+ev.target.id);
	console.log("put value : "+tagValue);
	var srcImg = ev.srcElement;
	if(srcImg.tagList == null) {
		var array = new Array();
		var att = document.createAttribute("tagList");
		srcImg.setAttributeNode(att);
		srcImg.tagList = array;
	}
	srcImg.tagList.push(tagValue);
}

function done_callback(ev)
{
	var ele="link_"+ev.target.id;
	var targetToRemove=document.getElementById(ele);
	targetToRemove.parentNode.removeChild(targetToRemove);
	var tagList = $(ev.srcElement).parent().parent().parent().children().first()[0].tagList;
	console.log(tagList);
}
