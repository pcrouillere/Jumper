// --------------------------------------------------------------
// --------------- ThumbnailTag CLASS ----------------
// --------------------------------------------------------------

function ThumbnailTag (pParent,pText){
	JsHtmlObject.call(this, pParent, "button",null);
	
	this.addClass("ThumbnailTag");
	this.getHtmlObject().innerHTML = "#"+pText;
	
	$(this.getHtmlObject()).on("click",function(e){
		var tagList = $(this).parent().parent().parent()[0].tagList;
		var index = tagList.indexOf(this.innerHTML);
		tagList.splice(index,1);
		$(this).remove();
	});
	
};
ThumbnailTag.prototype = new JsHtmlObject();
ThumbnailTag.prototype.constructor = ThumbnailTag;

ThumbnailTag.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailTag.prototype.addText = function(pText) {

};

