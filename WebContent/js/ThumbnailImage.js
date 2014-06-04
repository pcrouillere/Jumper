function ThumbnailImage (pParent,pSource){
	JsHtmlObject.call(this, pParent, "div",null);
	
	this.cSource = pSource;
	this.cIframe = document.createElement("iframe");
	this.cIframe.src = this.cSource;
	this.cIframe.scrolling = "no";
	this.cIframe.sandbox = "allow-same-origin allow-scripts allow-popups allow-forms";
	this.cIframe.classList.add("frame");
	console.log(pSource);
	this.getHtmlObject().appendChild(this.cIframe);
	
	this.cIframe.ondrop = function(e) {
		alert('drop');
	};
	this.cIframe.ondragover = function(e) {
		allowDrop(e);
	};
	
	this.addClass("ThumbnailImage");
	
};
ThumbnailImage.prototype = new JsHtmlObject();
ThumbnailImage.prototype.constructor = ThumbnailImage;

ThumbnailImage.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};


