<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	List<Tag> tags = (List<Tag>) request.getAttribute("tags");
%>
<%
	List<Url> urls = (List<Url>) request.getAttribute("untaggedurls");
%>
<!--Les section, c'est la partie coeur, c'est la ou on doit developper les differentes fonctionnalitées -->

<section>
<style type="text/css">
/* Default width of the player */
@default-player-width: 750px;

/* Default size of canvas */
@default-canvas-width: 640px;
@default-canvas-height: 360px;

@default-thumbnail-height: 200px;

/* Extra Extra small screen / phone - vertical */
@xxs-screen-width: 320px;
@screen-phoneV-width: 320px;
@screen-phoneV-height: floor((@screen-phoneV-width*@default-canvas-height)/@default-canvas-width);

/* Extra small screen / phone - horizontal */
@xs-screen-width: 480px;
@screen-phoneH-width: 480px;
@screen-phoneH-height: floor((@screen-phoneH-width*@default-canvas-height)/@default-canvas-width);

/* Small screen / tablet - vertical */
@s-screen-width: 768px;
/*@s-screen-width: 800px;*/
@screen-tablet-width: @default-player-width;
@screen-tablet-height: floor((@screen-tablet-width*@default-canvas-height)/@default-canvas-width);

/* Medium screen / desktop */
@m-screen-width: 992px;
@screen-desktop-width: @default-player-width;
@screen-desktop-height: floor((@screen-desktop-width*@default-canvas-height)/@default-canvas-width);

/* Large screen / wide desktop*/
@l-screen-width: 1200px;
@screen-l-desktop-width: @default-player-width;
@screen-l-desktop-height: floor((@screen-l-desktop-width*@default-canvas-height)/@default-canvas-width); 


/* Thumbnail default height */ 
@tn-default-height: 50px;

/* Thumbnail width for extra small sceen / phone - vertical */ 
@tn-phoneV-width: floor((@tn-default-height*320)/240);

/* Thumbnail width for extra small sceen / phone - horizontal */ 
@tn-phoneH-width: floor((@tn-default-height*480)/360);

/* Thumbnail width for small sceen / tablet */
@tn-tablet-width: floor((@tn-default-height*640)/360);

/* Thumbnail width for medium sceen / desktop */
@tn-desktop-width: floor((@tn-default-height*854)/480);

/* Thumbnail width for large sceen / wide desktop */ 
@tn-l-desktop-width: floor((@tn-default-height*1280)/720);

/*Vignette text variable*/
@vignette-font-familly: "Arial";
@vignette-font-size: 8px;

/* Control bar height */
@controlBar-height: 30px;

/* background for sprite */
.background-icon(@x-position, @y-position, @x-size:820px, @y-size:428px) {
	background: url("../assets/sprite.png") no-repeat transparent;
	background-position: @x-position @y-position;
	background-size: @x-size @y-size;
}


#less {
  .default_player_width { width: @default-player-width; }
  .default_canvas_width { width: @default-canvas-width; }
  .default_canvas_height{ height: @default-canvas-height; }
  .xxs_screen_width { width: @xxs-screen-width; }
  .screen_phoneV_width { width: @screen-phoneV-width; }
  .screen_phoneV_height { height: @screen-phoneV-height; }
  .xs_screen_width { width: @xs-screen-width; }
  .screen_phoneH_width { width: @screen-phoneH-width ; }
  .screen_phoneH_height { height: @screen-phoneH-height; }
  .s_screen_width { width: @s-screen-width; }
  .screen_tablet_width { width: @screen-tablet-width; }
  .screen_tablet_height { height: @screen-tablet-height; }
  .m_screen_width { width: @m-screen-width; }
  .screen_desktop_width { width: @screen-desktop-width; }
  .screen_desktop_height { height: @screen-desktop-height; }
  .l_screen_width { width: @l-screen-width; }
  .screen_l_desktop_width { width: @screen-l-desktop-width; }
  .screen_l_desktop_height { height: @screen-l-desktop-height; }
  .tn_default_height { height: @tn-default-height; }
  .tn_phoneV_width { width: @tn-phoneV-width; }
  .tn_phoneH_width { width: @tn-phoneH-width; }
  .tn_tablet_width { width: @tn-tablet-width; }
  .tn_desktop_width { width: @tn-desktop-width; }
  .tn_l_desktop_width { width: @tn-l-desktop-width; }
  .controlBar_height { width: @controlBar-height; }
}
// Style for small mobile vertical
@media only screen and (max-width: @xxs-screen-width) {
html,body {
  #barWrapper{
    .RecommandationBar{
      .Arrow {
        span{
        }
      }
      .ThumbnailContainer{
        .Thumbnail{
          .ThumbnailImage{
          }
          .ThumbnailInfo{
            .ThumbnailInfoTitle{
              h4{
                font-size:40%;
              }
            }
            .ThumbnailTagContainer{
              button{
                margin-top:0px;
                font-size:30%;
              }
            }
          }
        }
      }
    }
  }
}
}

// Style for mobile vertical
@media only screen and (min-width: @xxs-screen-width) and (max-width: @xs-screen-width) { 
     html,body {
  #barWrapper{
    .RecommandationBar{
      .Arrow {
        span{
        }
      }
      .ThumbnailContainer{
        .Thumbnail{
          .ThumbnailImage{
          }
          .ThumbnailInfo{
            .ThumbnailInfoTitle{
              h4{
                font-size:50%;
              }
            }
            .ThumbnailTagContainer{
              button{
                margin-top:0px;
                font-size:40%;
              }
            }
          }
        }
      }
    }
  }
}
}


// Style for mobile horizontal
@media only screen and (min-width: @xs-screen-width) and (max-width: @s-screen-width) {
html,body {
  #barWrapper{
    .RecommandationBar{
      .Arrow {
        span{
        }
      }
      .ThumbnailContainer{
        .Thumbnail{
          .ThumbnailImage{
          }
          .ThumbnailInfo{
            .ThumbnailInfoTitle{
              h4{
                font-size:60%;
              }
            }
            .ThumbnailTagContainer{
              button{
                margin-top:0px;
                font-size:40%;
              }
            }
          }
        }
      }
    }
  }
}
}

// Style for tablet
@media only screen and (min-width: @s-screen-width) and (max-width: @m-screen-width) {	
html,body {
  #barWrapper{
    .RecommandationBar{
      .Arrow {
        span{
        }
      }
      .ThumbnailContainer{
        .Thumbnail{
          .ThumbnailImage{
          }
          .ThumbnailInfo{
            .ThumbnailInfoTitle{
              h4{
                font-size:70%;
              }
            }
            .ThumbnailTagContainer{
              button{
                margin-top:2px;
                font-size:50%;
              }
            }
          }
        }
      }
    }
  }
}
}

// Style for desktop
@media only screen and (min-width: @m-screen-width) and (max-width: @l-screen-width) {
html,body {
  #barWrapper{
    .RecommandationBar{
      .Arrow {
        span{
        }
      }
      .ThumbnailContainer{
        .Thumbnail{
          .ThumbnailImage{
          }
          .ThumbnailInfo{
            .ThumbnailInfoTitle{
              h4{
                font-size:80%;
              }
            }
            .ThumbnailTagContainer{
              button{
                margin-top:2px;
                font-size:60%;
              }
            }
          }
        }
      }
    }
  }
}
}

// Style for wide desktop
@media only screen and (min-width: @l-screen-width) {
html,body {
  #barWrapper{
    .RecommandationBar{
      .Arrow {
        span{
        }
      }
      .ThumbnailContainer{
        .Thumbnail{
          .ThumbnailImage{
          }
          .ThumbnailInfo{
            .ThumbnailInfoTitle{
              h4{
                font-size:100%;
              }
            }
            .ThumbnailTagContainer{
              button{
                margin-top:2px;
                font-size:80%;
              }
            }
          }
        }
      }
    }
  }
}
html,body {
  margin:0px;
  padding:0px;
      .ThumbnailContainer{
        float:left;
        width:90%;
        
    	  .Thumbnail{
    	    border:1px solid black;
          background:white;
          height:@default-thumbnail-height;
          margin:20px 20px 0px 20px;
          overflow: hidden;
          float:left;
          position:relative;
          
          .ThumbnailImage{
            background-color: #dff0d8;
            width:100%;
            height:60%;
            margin:0 auto;
            position:relative;
            .frame{
              overflow:hidden;
              width:400%;
              height:400%;
              position:relative;
              -webkit-transform-origin: 0 0;
              overflow: hidden;
              .scale(0.25);
            }
          }
          
          .ThumbnailInfo{
            background-color: #dff0d8;
            width:100%;
            height:25%;
            border-top:1px solid black;
            .ThumbnailInfoTitle{
              background-color: #dff0d8;
              height:40%;
              margin:0 auto;
              cursor:pointer;
              h4{
                font-weight:bold;
                text-align:center;
                margin-top:0px;
              }
            }
            .ThumbnailTagContainer{
              background-color: #dff0d8;
              height:60%;
              margin:0 auto;
              .ThumbnailTag{
                background-color: #5cb85c;
                border-color: #4cae4c;
                font-weight:bold;
              }
            }
          }
		  .ThumbnailButton {
		  
		  }
        }
      }
	
/*----------------Overide Bootstrap------------*/
.container-fluid {
  padding-left: 0px;
  padding-right: 0px;
}
.btn {
  padding: 0px;
}
	
}
</style>
<script type="text/javascript">
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
	this.cParameters = this.parseParameters(pParameters);
	this.addClass("Thumbnail");
	this.addClass("container-fluid");
	
	this.addImage();
	this.addInfo();
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
	//this.addThumbnail();
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
		<div class="head_content_page">
			<h1>Ajouter des tags</h1>
			<div id="how_to_do">
					<div class="alert alert-info"><p>Drop all tags you want over the link</p></div>
			</div>
		</div>				
		<!-- This part should be loaded from Database, this is just an exemple -->
		<script>
		
		var container = new ThumbnailContainer(null,null);
		$('#content_page').prepend(container.getHtmlObject());
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
			  <span class="input-group-addon">Add tags</span>
			  <input type="text" class="form-control" placeholder="Tag name" id="tag_name">
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
	var urlid = thumbnail.urlid;
	var sender = new String("");
	var uri=new String("$$$"+url+"$$$");
	for(i=0,len=tagList.length;i<len;i++)
	{
		sender+=tagList[i].replace("#","")+"$$$";
	}
	sendRequest(urlid,sender);
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
	console.log("Send send : "+sender);
	console.log("uuuu" + url);
	httpRequest.open("GET", "?page=addtagurl&url="+url+"&list="+sender, false); 
	httpRequest.send(null);  
}

</script>