/*
 Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("scaytcheck",function(a){function b(){return"undefined"!=typeof document.forms["optionsbar_"+l]?document.forms["optionsbar_"+l].options:[]}function c(a,b){if(a){var c=a.length;if(void 0==c)a.checked=a.value==b.toString();else for(var d=0;d<c;d++)a[d].checked=!1,a[d].value==b.toString()&&(a[d].checked=!0)}}function d(a){k.getById("dic_message_"+l).setHtml('<span style="color:red;">'+a+"</span>")}function e(a){k.getById("dic_message_"+l).setHtml('<span style="color:blue;">'+a+"</span>")}function f(a){for(var a=(""+a).split(","),b=0,c=a.length;b<c;b+=1)k.getById(a[b]).$.style.display="inline"}function g(a){for(var a=(""+a).split(","),b=0,c=a.length;b<c;b+=1)k.getById(a[b]).$.style.display="none"}function h(a){k.getById("dic_name_"+l).$.value=a}var i=!0,j,k=CKEDITOR.document,l=a.name,m=CKEDITOR.plugins.scayt.getUiTabs(a),n,o=[],p=0,q=["dic_create_"+l+",dic_restore_"+l,"dic_rename_"+l+",dic_delete_"+l],r=["mixedCase","mixedWithDigits","allCaps","ignoreDomainNames"];n=a.lang.scayt;var s=[{id:"options",label:n.optionsTab,elements:[{type:"html",id:"options",html:'<form name="optionsbar_'+l+'"><div class="inner_options">\t<div class="messagebox"></div>\t<div style="display:none;">\t\t<input type="checkbox" name="options"  id="allCaps_'+l+'" />\t\t<label for="allCaps" id="label_allCaps_'+l+'"></label>\t</div>\t<div style="display:none;">\t\t<input name="options" type="checkbox"  id="ignoreDomainNames_'+l+'" />\t\t<label for="ignoreDomainNames" id="label_ignoreDomainNames_'+l+'"></label>\t</div>\t<div style="display:none;">\t<input name="options" type="checkbox"  id="mixedCase_'+l+'" />\t\t<label for="mixedCase" id="label_mixedCase_'+l+'"></label>\t</div>\t<div style="display:none;">\t\t<input name="options" type="checkbox"  id="mixedWithDigits_'+l+'" />\t\t<label for="mixedWithDigits" id="label_mixedWithDigits_'+l+'"></label>\t</div></div></form>'}]},{id:"langs",label:n.languagesTab,elements:[{type:"html",id:"langs",html:'<form name="languagesbar_'+l+'"><div class="inner_langs">\t<div class="messagebox"></div>\t   <div style="float:left;width:45%;margin-left:5px;" id="scayt_lcol_'+l+'" ></div>   <div style="float:left;width:45%;margin-left:15px;" id="scayt_rcol_'+l+'"></div></div></form>'}]},{id:"dictionaries",label:n.dictionariesTab,elements:[{type:"html",style:"",id:"dictionaries",html:'<form name="dictionarybar_'+l+'"><div class="inner_dictionary" style="text-align:left; white-space:normal; width:320px; overflow: hidden;">\t<div style="margin:5px auto; width:80%;white-space:normal; overflow:hidden;" id="dic_message_'+l+'"> </div>\t<div style="margin:5px auto; width:80%;white-space:normal;">        <span class="cke_dialog_ui_labeled_label" >Dictionary name</span><br>\t\t<span class="cke_dialog_ui_labeled_content" >\t\t\t<div class="cke_dialog_ui_input_text">\t\t\t\t<input id="dic_name_'+l+'" type="text" class="cke_dialog_ui_input_text"/>\t\t</div></span></div>\t\t<div style="margin:5px auto; width:80%;white-space:normal;">\t\t\t<a style="display:none;" class="cke_dialog_ui_button" href="javascript:void(0)" id="dic_create_'+l+'">\t\t\t\t</a>\t\t\t<a  style="display:none;" class="cke_dialog_ui_button" href="javascript:void(0)" id="dic_delete_'+l+'">\t\t\t\t</a>\t\t\t<a  style="display:none;" class="cke_dialog_ui_button" href="javascript:void(0)" id="dic_rename_'+l+'">\t\t\t\t</a>\t\t\t<a  style="display:none;" class="cke_dialog_ui_button" href="javascript:void(0)" id="dic_restore_'+l+'">\t\t\t\t</a>\t\t</div>\t<div style="margin:5px auto; width:95%;white-space:normal;" id="dic_info_'+l+'"></div></div></form>'}]},{id:"about",label:n.aboutTab,elements:[{type:"html",id:"about",style:"margin: 5px 5px;",html:'<div id="scayt_about_'+l+'"></div>'}]}],t={title:n.title,minWidth:360,minHeight:220,onShow:function(){var b=this;b.data=a.fire("scaytDialog",{}),b.options=b.data.scayt_control.option(),b.chosed_lang=b.sLang=b.data.scayt_control.sLang;if(!b.data||!b.data.scayt||!b.data.scayt_control)alert("Error loading application service"),b.hide();else{var c=0;i?b.data.scayt.getCaption(a.langCode||"en",function(a){0<c++||(j=a,u.apply(b),v.apply(b),i=!1)}):v.apply(b),b.selectPage(b.data.tab)}},onOk:function(){var a=this.data.scayt_control;a.option(this.options),a.setLang(this.chosed_lang),a.refresh()},onCancel:function(){var a=b(),d;for(d in a)a[d].checked=!1;a="undefined"!=typeof document.forms["languagesbar_"+l]?document.forms["languagesbar_"+l].scayt_lang:[],c(a,"")},contents:o};CKEDITOR.plugins.scayt.getScayt(a);for(n=0;n<m.length;n++)1==m[n]&&(o[o.length]=s[n]);1==m[2]&&(p=1);var u=function(){function a(a){var b=k.getById("dic_name_"+l).getValue();if(!b)return d(" Dictionary name should not be empty. "),!1;try{var c=a.data.getTarget().getParent(),e=/(dic_\w+)_[\w\d]+/.exec(c.getId())[1];t[e].apply(null,[c,b,q])}catch(f){d(" Dictionary error. ")}return!0}var b=this,c=b.data.scayt.getLangList(),i=["dic_create","dic_delete","dic_rename","dic_restore"],n=[],o=[],s;if(p){for(s=0;s<i.length;s++)n[s]=i[s]+"_"+l,k.getById(n[s]).setHtml('<span class="cke_dialog_ui_button">'+j["button_"+i[s]]+"</span>");k.getById("dic_info_"+l).setHtml(j.dic_info)}if(1==m[0])for(s in r)i="label_"+r[s],n=k.getById(i+"_"+l),"undefined"!=typeof n&&"undefined"!=typeof j[i]&&"undefined"!=typeof b.options[r[s]]&&(n.setHtml(j[i]),n.getParent().$.style.display="block");i='<p><img src="'+window.scayt.getAboutInfo().logoURL+'" /></p><p>'+j.version+window.scayt.getAboutInfo().version.toString()+"</p><p>"+j.about_throwt_copy+"</p>",k.getById("scayt_about_"+l).setHtml(i),i=function(a,c){var d=k.createElement("label");d.setAttribute("for","cke_option"+a),d.setHtml(c[a]),b.sLang==a&&(b.chosed_lang=a);var e=k.createElement("div"),f=CKEDITOR.dom.element.createFromHtml('<input id="cke_option'+a+'" type="radio" '+(b.sLang==a?'checked="checked"':"")+' value="'+a+'" name="scayt_lang" />');return f.on("click",function(){this.$.checked=!0,b.chosed_lang=a}),e.append(f),e.append(d),{lang:c[a],code:a,radio:e}};if(1==m[1]){for(s in c.rtl)o[o.length]=i(s,c.ltr);for(s in c.ltr)o[o.length]=i(s,c.ltr);o.sort(function(a,b){return b.lang>a.lang?-1:1}),c=k.getById("scayt_lcol_"+l),i=k.getById("scayt_rcol_"+l);for(s=0;s<o.length;s++)(s<o.length/2?c:i).append(o[s].radio)}var t={dic_create:function(a,b,c){var h=c[0]+","+c[1],i=j.err_dic_create,k=j.succ_dic_create;window.scayt.createUserDictionary(b,function(a){g(h),f(c[1]),k=k.replace("%s",a.dname),e(k)},function(a){i=i.replace("%s",a.dname),d(i+"( "+(a.message||"")+")")})},dic_rename:function(a,b){var c=j.err_dic_rename||"",f=j.succ_dic_rename||"";window.scayt.renameUserDictionary(b,function(a){f=f.replace("%s",a.dname),h(b),e(f)},function(a){c=c.replace("%s",a.dname),h(b),d(c+"( "+(a.message||"")+" )")})},dic_delete:function(a,b,c){var i=c[0]+","+c[1],k=j.err_dic_delete,l=j.succ_dic_delete;window.scayt.deleteUserDictionary(function(a){l=l.replace("%s",a.dname),g(i),f(c[0]),h(""),e(l)},function(a){k=k.replace("%s",a.dname),d(k)})}};t.dic_restore=b.dic_restore||function(a,b,c){var h=c[0]+","+c[1],i=j.err_dic_restore,k=j.succ_dic_restore;window.scayt.restoreUserDictionary(b,function(a){k=k.replace("%s",a.dname),g(h),f(c[1]),e(k)},function(a){i=i.replace("%s",a.dname),d(i)})},o=(q[0]+","+q[1]).split(","),s=0;for(c=o.length;s<c;s+=1)(i=k.getById(o[s]))&&i.on("click",a,this)},v=function(){var a=this;if(1==m[0])for(var d=b(),h=0,j=d.length;h<j;h++){var n=d[h].id,o=k.getById(n);o&&(d[h].checked=!1,1==a.options[n.split("_")[0]]&&(d[h].checked=!0),i)&&o.on("click",function(){a.options[this.getId().split("_")[0]]=this.$.checked?1:0})}1==m[1]&&(d=k.getById("cke_option"+a.sLang),c(d.$,a.sLang)),p&&(window.scayt.getNameUserDictionary(function(a){a=a.dname,g(q[0]+","+q[1]),a?(k.getById("dic_name_"+l).setValue(a),f(q[1])):f(q[0])},function(){k.getById("dic_name_"+l).setValue("")}),e(""))};return t});