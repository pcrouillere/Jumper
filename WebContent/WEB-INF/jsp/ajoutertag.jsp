<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
%>
<%
	List<Url> urls = (List<Url>) request.getAttribute("untaggedurls");
%>
<%
	User user = (User) session.getAttribute("user");
%>
<!--Les section, c'est la partie coeur, c'est la ou on doit developper les differentes fonctionnalitées -->

<section>

<style>
.ThumbnailContainer
{
	width:100%;
    margin : 0 auto;
}

.Thumbnail
{
	display: inline-block;
    padding: 4px;
    margin-bottom: 20px;
    line-height: 1.42857143;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out; 
    width:170 px;
}

.ThumbnailImage
{
	margin-left: auto;
    margin-right: auto;
}

.ThumbnailInfo:hover, .ThumbnailInfo:focus, .ThumbnailInfo.active
{
    border-color: #428bca;
}

.frame
{
	width:100% !important;
}
.img
{
	overflow:hidden;
	width:100px;
	height:100px;
	position:relative;
	-webkit-transform-origin: 0 0;
	overflow: hidden;
	scale:0.001;
}
img.resize
{
    width:200px; /* you can use % */
    height: 200px;
}

.ThumbnailInfo
{
	width:100%;
	height:25%;
	border-top:1px solid red;
}

.ThumbnailInfoTitle
{
	padding: 9px;
    color: #4A8B87;
}

.container-fluid
{
  padding-left: 0px;
  padding-right: 0px;
}

.btn 
{
	  padding: 0px;
}

.ThumbnailTagContainer
{
    height:60%;
    margin:0 auto;
}


button {
    color: #fff;
    background-color: #4A8B87;
    border-color: #4A8B87;
}
.ThumbnailButton {
	border-color: #C5252B;
    background-color: #C5252B;
    cursor:pointer;
}
.ThumbnailTag {
    cursor:pointer;
}
button:hover, button:focus, button:active, button.active, .open .dropdown-toggle.button {
    color: #fff;
    background-color: #3276b1;
    border-color: #285e8e;
}
button:active, button.active, .open .dropdown-toggle.button{
    background-image: none;
}
button.disabled, .button[disabled], fieldset[disabled] .button, .button.disabled:hover, .button[disabled]:hover, fieldset[disabled] .btn-primary:hover, .btn-primary.disabled:focus, .btn-primary[disabled]:focus, fieldset[disabled] .btn-primary:focus, .btn-primary.disabled:active, .btn-primary[disabled]:active, fieldset[disabled] .btn-primary:active, .btn-primary.disabled.active, .btn-primary[disabled].active, fieldset[disabled] .btn-primary.active {
    background-color: #428bca;
    border-color: #357ebd;
}
button.badge {
    color: #428bca;
    background-color: #fff;
}

#all_links
{
	width:100%;
	height:380px;
	position:relative;
	margin:0 auto;
}

.panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.panel-default {
    border-color: #ddd;
}
.panel-default>.panel-heading {
    color: #333;
    background-color: #4A8B87;
    border-color: #ddd;
}
.panel-default>.panel-heading+.panel-collapse .panel-body {
    border-top-color: #ddd;
}
.panel-default>.panel-footer+.panel-collapse .panel-body {
    border-bottom-color: #ddd;
}
.panel-body {
  padding: 15px;
}
.panel-heading {
  padding: 10px 15px;
  border-bottom: 1px solid transparent;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
}

.panel-title {
  margin-top: 0;
  margin-bottom: 0;
  font-size: 16px;
  color: white;
}
.panel-title > a {
  color: inherit;
}

.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
}
.input-group[class*=col-] {
    float: none;
    padding-left: 0;
    padding-right: 0;
}
.input-group .form-control {
    position: relative;
    z-index: 2;
    float: left;
    width: 86%;
    margin-bottom: 0;
}

.input-group-addon, .input-group-btn, .input-group .form-control {
    display: table-cell;
}

.input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child), .input-group .form-control:not(:first-child):not(:last-child) {
    border-radius: 0;
}

.input-group-addon, .input-group-btn {
    width: 1%;
    white-space: nowrap;
    vertical-align: middle;
}
.input-group-addon {
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: white;
    text-align: center;
    background-color: #4A8B87;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.input-group-addon input[type=radio], .input-group-addon input[type=checkbox] {
    margin-top: 0;
}

.input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child>.btn, .input-group-btn:first-child>.btn-group>.btn, .input-group-btn:first-child>.dropdown-toggle, .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle), .input-group-btn:last-child>.btn-group:not(:last-child)>.btn {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0;
}

.input-group-addon:first-child {
    border-right: 0;
}

.input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group>.btn, .input-group-btn:last-child>.dropdown-toggle, .input-group-btn:first-child>.btn:not(:first-child), .input-group-btn:first-child>.btn-group:not(:first-child)>.btn {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
}

.input-group-addon:last-child {
    border-left: 0;
}

.input-group-btn {
    position: relative;
    font-size: 0;
    white-space: nowrap;
}

.input-group-btn>.btn {
    position: relative;
}
.input-group-btn>.btn+.btn {
    margin-left: -1px;
}
.input-group-btn>.btn:hover, .input-group-btn>.btn:focus, .input-group-btn>.btn:active {
    z-index: 2;
}
.input-group-btn:first-child>.btn, .input-group-btn:first-child>.btn-group {
    margin-right: -1px;
}
.input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group {
    margin-left: -1px;
}

.form-control {
    display: block;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

#tag_names
{
	display : block;
	width: 218px;
	right: 0px;
    padding: 10px 15px;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd;
}
#tag_names:first-child {
    border-top-right-radius: 4px;
    border-top-left-radius: 4px;
}
#tag_names:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
}
#tag_names p {
    color: #555;
}

#tag_names p:hover, #tag_names p:focus {
    text-decoration: white;
    text-color:white;
    background-color: #4A8B87;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
    border-top-right-radius: 4px;
    border-top-left-radius: 4px;
}

</style>
<script>
function parseUri (str) {
    var     o   = parseUri.options,
            m   = o.parser[o.strictMode ? "strict" : "loose"].exec(str),
            uri = {},
            i   = 14;

    while (i--) uri[o.key[i]] = m[i] || "";

    uri[o.q.name] = {};
    uri[o.key[12]].replace(o.q.parser, function ($0, $1, $2) {
            if ($1) uri[o.q.name][$1] = $2;
    });

    return uri;
};

parseUri.options = {
    strictMode: false,
    key: ["source","protocol","authority","userInfo","user","password","host","port","relative","path","directory","file","query","anchor"],
    q:   {
            name:   "queryKey",
            parser: /(?:^|&)([^&=]*)=?([^&]*)/g
    },
    parser: {
            strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
            loose:  /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/
    }
};
</script>
<script type="text/javascript">
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

</script>
<script type="text/javascript">
function IS_NULL(pValue) {
	return (pValue == null || (( typeof pValue) == 'undefined'));
}

/**
 * return false if the value given is null or undefined
 * @function
 * @global
 * @param {Object} pValue a value
 * @return {Boolean} false if value is null or undefined
 */
function IS_NOT_NULL(pValue) {
	return (pValue != null && (( typeof pValue) != 'undefined') );
}
/**
 * return the initial position of the slider
 * @function
 * @global
 * @return {Number}
 */
function getCoordonateXY(element) {
	var rect = element.getBoundingClientRect();
	return { top: rect.top, right: rect.right , bottom: rect.bottom, left: rect.left };
}
/**
 * return the initial position of the slider
 * @function
 * @global
 * @return {Number}
 */
function getSliderStartPosition(pSlider,pAxis) {
	var handleOffset = -$($(pSlider.getHtmlObject()).children()[0]).innerWidth()/2;
	if(pAxis == "x"){
		return getCoordonateXY(pSlider.getHtmlObject()).left + handleOffset;
	} else {
		return getCoordonateXY(pSlider.getHtmlObject()).bottom + handleOffset;
	}
}
/**
 *
 * @function
 * @global
 */
function setCurrentTimeOnVideo(BarRange, BarValue, VideoDuration) {
	return Math.floor((BarValue / BarRange) * VideoDuration*100)/100;
}
/**
 * getLessVars parses your LESS variables to Javascript (provided you make a dummy node in LESS)
 * @param {String} id The CSS-id your variables are listed under.
 * @param {Boolean} [parseNumbers=true] Try to parse units as numbers.
 * @return {Object} A value object containing your LESS variables.
 * @example
 * LESS:
 * 	&#64;myLessVariable: 123px;
 * 	#dummyLessId { width: @myLessVariable; }
 * Javascript:
 * 	GET_LESS_VARIABLES('dummyLessId');
 * returns:
 * 	{myLessVariable:123}
 */
function GET_LESS_VARIABLES(id, parseNumbers) {
	var bNumbers = parseNumbers === undefined ? true : parseNumbers, oLess = {}, rgId = /\#\w+/, rgKey = /\.(\w+)/, rgUnit = /[a-z]+$/, aUnits = 'em,ex,ch,rem,vw,vh,vmin,cm,mm,in,pt,pc,px,deg,grad,rad,turn,s,ms,Hz,kHz,dpi,dpcm,dppx'.split(','), rgValue = /:\s?(.*)\s?;\s?\}/, rgStr = /^'([^']+)'$/, sId = '#' + id, oStyles = document.styleSheets;
	for (var i = 0, l = oStyles.length; i < l; i++) {
		var oRules = oStyles[i].cssRules;
		for (var j = 0, k = oRules.length; j < k; j++) {
			var sRule = oRules[j].cssText, aMatchId = sRule.match(rgId);
			if (aMatchId && aMatchId[0] == sId) {
				var aKey = sRule.match(rgKey), aVal = sRule.match(rgValue);
				if (aKey && aVal) {
					var sKey = aKey[1], oVal = aVal[1], aUnit, aStr;
					if (bNumbers && ( aUnit = oVal.match(rgUnit)) && aUnits.indexOf(aUnit[0]) !== -1) {
						oVal = parseFloat(oVal);
					} else if ( aStr = oVal.match(rgStr)) {
						oVal = aStr[1];
					}
					oLess[sKey] = oVal;
				}
			}
		}
	}
	return oLess;
}


</script>
<script type="text/javascript">
POST_REQUEST="POST";
GET_REQUEST="GET";

MAX_DISPLAYED_THUMBNAILS=5;

LEFT = "Left";
RIGHT = "Right";


</script>
<script type="text/javascript">
POST_REQUEST="POST";
GET_REQUEST="GET";

MAX_DISPLAYED_THUMBNAILS=5;

LEFT = "Left";
RIGHT = "Right";


</script>
<script type="text/javascript">
function Bar (pParameters) {
	JsHtmlObject.call(this, null, "div", null);
	this.addClass("RecommandationBar");
	this.addClass("container-fluid");
	
	document.getElementById("barWrapper").appendChild(this.getHtmlObject());
	
	this.cParameters = pParameters;
	this.cThumbnailContainer;
	this.addContainer();
	this.addArrow(LEFT);this.addArrow(RIGHT);
	
	var t = this;
	Hammer(this.getHtmlObject(),{swipe_velocity: 0.3}).on("swiperight", function(e) {
		t.move(LEFT);
	});
	Hammer(this.getHtmlObject(),{swipe_velocity: 0.3}).on("swipeleft", function(e) {
		t.move(RIGHT);
	});
};
Bar.prototype = new JsHtmlObject();
Bar.prototype.constructor = Bar;

Bar.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Bar.prototype.addContainer = function(pClassName) {
	this.cThumbnailContainer = new ThumbnailContainer(this,this.cParameters);
};

Bar.prototype.addArrow = function(pSens) {
	var arrow = new Arrow(this,pSens);
	if(pSens=="Right"){
		$(this.getHtmlObject()).append(arrow.getHtmlObject());
	} else {
		$(this.getHtmlObject()).prepend(arrow.getHtmlObject());
	}
};

Bar.prototype.move = function(pSens) {
	this.cThumbnailContainer.move(pSens);
};


</script>
<script type="text/javascript">
function Thumbnail (pParent,pThumbNb,pParameters){
	JsHtmlObject.call(this, pParent, "div", "thumb"+pThumbNb);
	
	this.getHtmlObject().style.width = (100/MAX_DISPLAYED_THUMBNAILS)+"%";
	
	this.cThumbId = pThumbNb;
	this.cListeTags = new Array();	
	this.cUrl;
	this.cUrlid;
	this.cImage;
	this.cInfo;
	this.cButton;
	this.cList;
	this.cParameters = this.parseParameters(pParameters);
	this.addClass("Thumbnail");
	this.addClass("container-fluid");
	
	this.addImage();
	this.addInfo();
	this.addDropdown();
	this.addButton();
	
 	this.getHtmlObject().ondrop = function(e) {
		drop(e);
	};
	this.getHtmlObject().ondragover = function(e) {
		allowDrop(e);
	}; 

	var att = document.createAttribute("url");
	this.getHtmlObject().setAttributeNode(att);
	this.getHtmlObject().url = this.cUrl;
	var attid = document.createAttribute("urlid");
	this.getHtmlObject().setAttributeNode(attid);
	this.getHtmlObject().urlid = this.cUrlid;
};
Thumbnail.prototype = new JsHtmlObject();
Thumbnail.prototype.constructor = Thumbnail;

Thumbnail.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Thumbnail.prototype.addImage = function() {
	this.cImage = new ThumbnailImage(this,this.cUrl);
	this.getHtmlObject().appendChild(this.cImage.getHtmlObject());
};

Thumbnail.prototype.addInfo = function() {
	this.cInfo = new ThumbnailInfo(this,this.cUrl,this.cListeTags);
	this.getHtmlObject().appendChild(this.cInfo.getHtmlObject());
};

Thumbnail.prototype.addButton = function() {
	this.cButton = new ThumbnailButton(this);
	this.getHtmlObject().appendChild(this.cButton.getHtmlObject());
};

Thumbnail.prototype.addDropdown = function() {
	this.cList = new ThumbnailDropdownList(this);
	this.getHtmlObject().appendChild(this.cList.getHtmlObject());
};

Thumbnail.prototype.parseParameters = function(pParam) {
	var param = JSON.parse(pParam).parameters;
	this.cUrl = param[0][this.cThumbId][0].url;
	this.cUrlid= param[0][this.cThumbId][1].idurl;
	/*var tags = param[0][this.cThumbId][1].tags;
	for(i=0,len=tags.length;i<len;i++){
		this.cListeTags.push(tags[i][i]);
	}*/
};
</script>
<script type="text/javascript">
function ThumbnailContainer (pParent){
	JsHtmlObject.call(this, null, "div", null);
	
	this.cThumbnails = new Array();
	this.cNbThumbnails = 0;
	this.cCurrentFirstThumbnails = 0;
	
	this.addClass("ThumbnailContainer");
	this.addClass("container-fluid"); 
};
ThumbnailContainer.prototype = new JsHtmlObject();
ThumbnailContainer.prototype.constructor = ThumbnailContainer;

ThumbnailContainer.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailContainer.prototype.move = function(pSens) {
	if(pSens == RIGHT && this.cCurrentFirstThumbnails > 0) {
		this.removeThumbnail(this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS-1);
		this.appendThumbnail(pSens,this.cCurrentFirstThumbnails-1);
		this.cCurrentFirstThumbnails--;
	} else if(pSens == LEFT && this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS < this.cNbThumbnails){
		this.removeThumbnail(this.cCurrentFirstThumbnails);
		this.appendThumbnail(pSens,this.cCurrentFirstThumbnails+MAX_DISPLAYED_THUMBNAILS);
		this.cCurrentFirstThumbnails++;
	}
};

ThumbnailContainer.prototype.removeThumbnail = function(index) {
	$(this.cThumbnails[index].getHtmlObject()).remove();
};

ThumbnailContainer.prototype.appendThumbnail = function(pSens,index) {
	if(pSens == RIGHT) {
		$(this.getHtmlObject()).prepend(this.cThumbnails[index].getHtmlObject());
	} else {
		$(this.getHtmlObject()).append(this.cThumbnails[index].getHtmlObject());
	}
};

ThumbnailContainer.prototype.addThumbnail = function(param) {
	var thumb = new Thumbnail(this,this.cNbThumbnails,param);
	this.cThumbnails.push(thumb);
	if(this.cNbThumbnails >= MAX_DISPLAYED_THUMBNAILS) {
		this.getHtmlObject().removeChild(thumb.getHtmlObject());
	}
	this.cNbThumbnails++;
};


</script>
<script type="text/javascript">
function ThumbnailImage (pParent,pSource){
	JsHtmlObject.call(this, pParent, "div",null);
	
	this.cSource = pSource;
	this.cIframe = document.createElement("img");
	this.cIframe.src = 'http://img.bitpixels.com/getthumbnail?code=43419&url='+this.cSource;
	this.cIframe.scrolling = "no";
	this.cIframe.sandbox = "allow-same-origin allow-scripts allow-popups allow-forms";
	this.cIframe.classList.add("frame");
	console.log(pSource);
	this.getHtmlObject().appendChild(this.cIframe);

	this.getHtmlObject().ondrop = function(e) {
		dropFrame(e);
	};
	this.getHtmlObject().ondragover = function(e) {
		allowDrop(e);
	}; 
	
	this.addClass("ThumbnailImage");
	
};
ThumbnailImage.prototype = new JsHtmlObject();
ThumbnailImage.prototype.constructor = ThumbnailImage;

ThumbnailImage.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};



</script>
<script type="text/javascript">
function ThumbnailInfo (pParent,pUrl,pListeTags){
	JsHtmlObject.call(this, pParent, "div",null);
	this.cListeTags = pListeTags;
	this.cUrl = pUrl;
	this.cInfoTitle;
	this.cInfoTags;
	
	this.addClass("ThumbnailInfo");
	this.addClass("container-fluid");
	
	this.addTitle(this.cUrl);
	this.addTags();
	this.getHtmlObject().ondrop = function(e) {
		dropInfo(e);
	};
	this.getHtmlObject().ondragover = function(e) {
		allowDrop(e);
	}; 
};
ThumbnailInfo.prototype = new JsHtmlObject();
ThumbnailInfo.prototype.constructor = ThumbnailInfo;

ThumbnailInfo.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfo.prototype.addTitle = function(pTitle) {
	this.cInfoTitle = new ThumbnailInfoTitle(this,pTitle);
	this.getHtmlObject().appendChild(this.cInfoTitle.getHtmlObject());
};

ThumbnailInfo.prototype.addTags = function() {
	this.cInfoTags = new ThumbnailInfoTagContainer(this,this.cListeTags);
	this.getHtmlObject().appendChild(this.cInfoTags.getHtmlObject());
};

ThumbnailInfo.prototype.getTitle = function() {
	return this.cInfoTitle;
};

</script>
<script type="text/javascript">

function ThumbnailInfoTitle (pParent,pText){
	JsHtmlObject.call(this, pParent, "div",null);
	this.cOriginalUrl = pText;
	this.cText = this.parseTitle(pText);
	this.cTitle;
	
	this.addClass("ThumbnailInfoTitle");
	this.addClass("container-fluid");
	
	this.addText(this.cText); 
};
ThumbnailInfoTitle.prototype = new JsHtmlObject();
ThumbnailInfoTitle.prototype.constructor = ThumbnailInfoTitle;

ThumbnailInfoTitle.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfoTitle.prototype.addText = function(pText) {
	title = document.createElement('h4');
	link = document.createElement('a');
	link.innerHTML = pText;
	link.href = this.cOriginalUrl;
	link.target = "_blank";
	title.appendChild(link);
	this.getHtmlObject().appendChild(title);
};

ThumbnailInfoTitle.prototype.parseTitle = function(url) {
	return parseUri(url).host;
};


</script>
<script type="text/javascript">
function ThumbnailInfoTagContainer (pParent,pListeTags){
	JsHtmlObject.call(this, pParent, "div",null);
	
	this.cListeTags = pListeTags;
	
	this.addClass("ThumbnailTagContainer");
	this.addClass("container-fluid");
	
	this.addAllTags();
	
};
ThumbnailInfoTagContainer.prototype = new JsHtmlObject();
ThumbnailInfoTagContainer.prototype.constructor = ThumbnailInfoTagContainer;

ThumbnailInfoTagContainer.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

ThumbnailInfoTagContainer.prototype.initTag = function(pTag) {	
	return '<button type="button" class="btn">#'+pTag+'</button>';
};

ThumbnailInfoTagContainer.prototype.addAllTags = function() {
	for(i=0,len = this.cListeTags.length;i<len;i++){
		this.getHtmlObject().innerHTML += this.initTag(this.cListeTags[i])+"  ";
	}
};
ThumbnailInfoTagContainer.prototype.addTag = function(pTexte) {
	this.getHtmlObject().innerHTML += this.initTag(pTexte)+" ";
};


</script>
<script type="text/javascript">
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
</script>
<script type="text/javascript">
function ThumbnailDropdownList (pParent){
	JsHtmlObject.call(this, pParent, "select",null);
	this.addClass("ThumbnailDropdownList");
	this.cThemes = ["Société","Politique","Economie","Science","Sport","Culture","Voyages"];
	this.addOptions();
};
ThumbnailDropdownList.prototype = new JsHtmlObject();
ThumbnailDropdownList.prototype.constructor = ThumbnailDropdownList;

ThumbnailDropdownList.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};
ThumbnailDropdownList.prototype.addOptions = function() {
	for(var i=0,len=this.cThemes.length;i<len;i++){
		this.addOption(this.cThemes[i]);
	}
};
ThumbnailDropdownList.prototype.addOption = function(pName) {
	var option = document.createElement('option');
	option.value = pName;
	option.innerHTML = pName;
	$(this.getHtmlObject()).append(option);
};
</script>
<script type="text/javascript">
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


</script>
<script type="text/javascript">
function Arrow (pParent,pSens){
	JsHtmlObject.call(this, pParent, "div", "arrow"+pSens);
	var t = this;
	
	this.cSens = pSens;
	
	this.addClass("Arrow");
	this.getHtmlObject().style.height = $(pParent.getHtmlObject()).innerHeight()+"px";
	this.addGlyph();
	
	$(this.getHtmlObject()).on("click",function(){
		t.getParent().move(t.cSens)
	});
};
Arrow.prototype = new JsHtmlObject();
Arrow.prototype.constructor = Arrow;

Arrow.prototype.addClass = function(pClassName) {
	this.getHtmlObject().classList.add(pClassName);
};

Arrow.prototype.addGlyph = function() {
	var glyph = document.createElement('span');
	glyph.classList.add("glyphicon");
	if(this.cSens == "Right"){
		glyph.classList.add("glyphicon-chevron-right");
	}else{
		glyph.classList.add("glyphicon-chevron-left");
	}
	//glyph.style.top = $(this.getHtmlObject()).innerHeight()/2-20+"px";
	this.getHtmlObject().appendChild(glyph);
};



</script>
	<div id="content_page">
		<div id="all_links">	
			<!-- This part should be loaded from Database, this is just an exemple -->
			<script>
			
			var container = new ThumbnailContainer(null,null);
			$('#all_links').prepend(container.getHtmlObject());
			</script>
			<% 
				int i=0;
				while ( i<urls.size())
				{
			%>
			<script>
			var count = String(<%=i%>);
			var url = "<%=urls.get(i).getuUri()%>";
			var iduri="<%=urls.get(i).getuId()%>";
			count = '"'+count+'"';
			console.log(url);
			url = '"'+url+'"';
			iduri= '"'+iduri+'"';
			//console.log(j);
			var parameters = '{"parameters":['+
			'{'+count+':[{"url":'+url+'},{"idurl":'+iduri+'}]}'+
			']}';
				container.addThumbnail(parameters);
			</script>
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
							<%
								i=0;
								while(i<tags.size())
								{
							%>
							<p draggable="true" ondragstart="drag(event,'<%=tags.get(i).gettName()%>')" id=<%=tags.get(i).gettName()%>><%= "#"+tags.get(i).gettName() %></p>		
							<%
									i++;
								}
							%>			
						</div>
					</div>
				</div>
			<div id="input_tag">
				<div class="input-group">
				  <span class="input-group-addon">Ajouter</span>
				  <input type="text" class="form-control" placeholder="nom du tag" id="tag_name">
				</div>
			</div>
		</div>
		</aside>			
</section>
<script type="text/javascript">
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
function handleDrop(ev,tagContainer,tagValue,srcImg)
{
	if(srcImg.tagList == null) {
		var array = new Array();
		var att = document.createAttribute("tagList");
		srcImg.setAttributeNode(att);
		srcImg.tagList = array;
	}
	if(srcImg.tagList.indexOf("#"+tagValue)==-1) {
		srcImg.tagList.push("#"+tagValue);
		var tag = new ThumbnailTag(null,tagValue);
		$(tag).remove();
		$(tagContainer).append(tag.getHtmlObject());
	}
}
function drop(ev)
{
	var tagValue = ev.dataTransfer.getData("tag_names");
	var srcImg = ev.srcElement;
	var tagContainer = $($(srcImg).children()[1]).children()[1];
	handleDrop(ev,tagContainer,tagValue,srcImg);
}

function dropFrame(ev)
{
	var tagValue = ev.dataTransfer.getData("tag_names");
	var Thumbnail = $(ev.srcElement).parent().parent()[0];
	var tagContainer = $($(Thumbnail).children()[1]).children()[1];
	handleDrop(ev,tagContainer,tagValue,Thumbnail);
	ev.stopPropagation();
	ev.cancelBubble = true;
	ev.preventDefault();
}

function dropInfo(ev)
{
	ev.stopPropagation();
	ev.cancelBubble = true;
	ev.preventDefault();

}
function dropInfoTitle(ev)
{
	ev.stopPropagation();
	ev.cancelBubble = true;
	ev.preventDefault();

}

function done_callback(ev)
{
	var thumbnail = $(ev.target).parent()[0];
	var theme = $(thumbnail).children()[2].value;
	var tagList = thumbnail.tagList;
	var url = thumbnail.url;
	var urlid = thumbnail.urlid;
	var sender = new String("");
	var userid = <%= user.getuId()%>;
	var uri=new String("$$$"+url+"$$$");
	if(tagList!=null){
		for(i=0,len=tagList.length;i<len;i++)
		{
			sender+=tagList[i].replace("#","")+"@";
		}
		sendRequest(urlid,sender);
		sendRequestToRestServer(userid,url,sender,theme);
		$(ev.target).parent().remove();
	}
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
	console.log("Send send : "+sender);
	console.log("uuuu" + url);
	httpRequest.open("GET", "?page=addtagurl&url="+url+"&list="+sender, false); 
	httpRequest.send(null);  
}

function sendRequestToRestServer(userid,url,sender,theme)
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
	httpRequest.open("POST", "http://192.168.43.8:8182/ServerRest?userid="+"jack"+"&url="+url+"&list="+sender+"&theme="+theme+"&op="+0, true); 
	httpRequest.send();  
}

</script>