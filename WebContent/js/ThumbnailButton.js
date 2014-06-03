// --------------------------------------------------------------
// --------------- ThumbnailButton CLASS ----------------
// --------------------------------------------------------------

function ThumbnailButton (pParent){
	JsHtmlObject.call(this, pParent, "button",null);
	this.getHtmlObject().innerHTML = "Done";
	this.addClass("ThumbnailButton");
	this.getHtmlObject().onclick = function(e){
		done_callback(e);
	};
};
ThumbnailButton.prototype = new JsHtmlObject();
ThumbnailButton.prototype.constructor = ThumbnailButton;

ThumbnailButton.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

