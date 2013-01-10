/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){CKEDITOR.on("instanceReady",function(a){var a=a.editor,b=CKEDITOR.document.$.getElementsByName("ckeditor-sample-required-plugins"),b=b.length?CKEDITOR.dom.element.get(b[0]).getAttribute("content").split(","):[],c=[];if(b.length){for(var d=0;d<b.length;d++)a.plugins[b[d]]||c.push("<code>"+b[d]+"</code>");c.length&&CKEDITOR.dom.element.createFromHtml('<div class="warning"><span>To fully experience this demo, the '+c.join(", ")+" plugin"+(1<c.length?"s are":" is")+" required.</span></div>").insertBefore(a.container)}})})();