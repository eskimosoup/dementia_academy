/**
 * editor_plugin_src.js
 *
 * Copyright 2009, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */
!function(){tinymce.create("tinymce.plugins.AdvancedLinkPlugin",{init:function(e,t){this.editor=e,e.addCommand("mceAdvLink",function(){var i=e.selection;(!i.isCollapsed()||e.dom.getParent(i.getNode(),"A"))&&e.windowManager.open({file:t+"/link.htm",width:480+parseInt(e.getLang("advlink.delta_width",0)),height:400+parseInt(e.getLang("advlink.delta_height",0)),inline:1},{plugin_url:t})}),e.addButton("link",{title:"advlink.link_desc",cmd:"mceAdvLink"}),e.addShortcut("ctrl+k","advlink.advlink_desc","mceAdvLink"),e.onNodeChange.add(function(e,t,i,n){t.setDisabled("link",n&&"A"!=i.nodeName),t.setActive("link","A"==i.nodeName&&!i.name)})},getInfo:function(){return{longname:"Advanced link",author:"Moxiecode Systems AB",authorurl:"http://tinymce.moxiecode.com",infourl:"http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/advlink",version:tinymce.majorVersion+"."+tinymce.minorVersion}}}),tinymce.PluginManager.add("souperlink",tinymce.plugins.AdvancedLinkPlugin)}();