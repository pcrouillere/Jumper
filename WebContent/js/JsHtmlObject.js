function JsHtmlObject(pJsParent, pHtmlType, pHtmlId, pWidth, pHeight) {
	
	this.cParent = pJsParent;
	this.cHtmlObject = null;

	if (IS_NULL(pJsParent) && IS_NULL(pHtmlType) && IS_NULL(pHtmlId)) {
		//Heritage creation
		return false;
	}
	if (IS_NULL(pHtmlType)) {
		//If Html type not defined,

		if (!IS_NULL(pJsParent)) {
			this.cHtmlObject = pJsParent;
		} else if (!IS_NULL(pHtmlId)) {
			this.cHtmlObject = document.getElementById(pHtmlId);
			if (IS_NULL(this.cHtmlObject)) {
				return false;
			}
		} else {
			return false;
		}
	} else {
		this.cHtmlObject = document.createElement(pHtmlType);
		if (!IS_NULL(pHtmlId)){
		this.cHtmlObject.id = pHtmlId;
		}
		if (!IS_NULL(pWidth)){
			this.cHtmlObject.width = pWidth;
		}
		if (!IS_NULL(pHeight)) {
			this.cHtmlObject.height = pHeight;
		}
		if (!IS_NULL(pJsParent)){
			pJsParent.getHtmlObject().appendChild(this.cHtmlObject);
		} else {
			document.body.appendChild(this.cHtmlObject);
		}
	}
	/*$(this.cHtmlObject).dblclick(function(e){
		e.preventDefault();
	});*/
	return true;
};

/**
 * Get the instance of the HTML object, this element controls
 * @function
 * @return {HtmlObject} the instance of the HTML object, this element controls
 */
JsHtmlObject.prototype.getHtmlObject = function() {
	return this.cHtmlObject;
};

JsHtmlObject.prototype.getParent = function() {
	if(!IS_NULL(this.cParent)){
		return this.cParent;
	} else {
		return document;
	}
	
};

