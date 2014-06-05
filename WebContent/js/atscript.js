var tag_input = document.getElementById("tag_name");
var count=1;

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
	var tagValue = ev.dataTransfer.getData("tag_names");
	var srcImg = ev.srcElement;
	var tagContainer = $($(srcImg).children()[1]).children()[1];
	console.log($($(srcImg).children()[1]).children()[1]);
	//tagContainer.innerHTML += '<button type="button" class="btn">#'+tagValue+'</button>';
	
	if(srcImg.tagList == null) {
		var array = new Array();
		var att = document.createAttribute("tagList");
		srcImg.setAttributeNode(att);
		srcImg.tagList = array;
	}
	if(srcImg.tagList.indexOf("#"+tagValue)==-1) {
		srcImg.tagList.push("#"+tagValue);
		var tag = new ThumbnailTag(null,tagValue);
		$(tagContainer).append(tag.getHtmlObject());
	}
}

function done_callback(ev)
{
	var thumbnail = $(ev.target).parent()[0];
	var tagList = thumbnail.tagList;
	var url = thumbnail.url;
	var sender = new String();
	var uri=new String("$$$"+url+"$$$");
	for(i=0,len=tagList.length;i<len;i++)
	{
		sender+="$$$"+tagList[i]+"$$$";
	}
	console.log(url);
	$(ev.target).parent().remove();
}

function sendRequest(url,sender)
{ 
	if (window.XMLHttpRequest) 
	{ 
		httpRequest = new XMLHttpRequest(); 
	} 
	else if (window.ActiveXObject) 
	{ 
		httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
	}	
	if (!httpRequest)
	{ 
		alert('Abandon :Impossible de crÃ©er une instance XMLHTTP'); 
		return false; 
	} 

	httpRequest.onreadystatechange = function() 
	{ 
	};
	console.log(sender);
	httpRequest.open("GET", "addtag?url="+url+"&?list="+sender, false); 
	httpRequest.send(null);  
}
