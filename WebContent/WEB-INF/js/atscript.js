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