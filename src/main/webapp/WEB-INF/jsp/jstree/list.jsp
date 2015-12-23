<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="${pageContext.request.locale}">
<head>
<link href="<c:url value="/jqueryui/jquery-ui.css" />" media="screen" rel="stylesheet">
<link href="<c:url value="/jqueryui/jquery-ui.theme.css" />" media="screen" rel="stylesheet">
<link href="<c:url value="/jqgrid/css/ui.jqgrid.css" />" media="screen" rel="stylesheet">
<link href="<c:url value="/jstree/themes/default/style.min.css" />" media="screen" rel="stylesheet">

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<c:url value="/jqueryui/jquery-ui.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jqgrid/js/jquery.jqGrid.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jqgrid/js/i18n/grid.locale-en.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jstree/jstree.js"/>"></script>


<script type="text/javascript">
$(document).ready(function() {

 	$('#tree').jstree({ 'core' : {
	    'data' : [
	       'Simple root node',
	       {'text' : 'Root node 2','state' : {'opened' : true,'selected' : true},
	         'children' : [
	           { 'text' : 'Child 1' },
	           'Child 2'
	         ]
	      }
	    ]
	} });
 

	/*  $("#using_json").jstree({
	    "json_data" : {
	        "ajax" : {
	            "url" : "/spider/jstree/jsonList.do",
	            "data" : function (n) {
	                return { id : n.attr ? n.attr("id") : 0 };
	            }
	        }
	    },
	    "plugins" : [ "themes", "json_data" ]
	}); 
	 
	   */
	 
	 
	$.ajax({
	       async : true,
	       type : "GET",
	       url : "/spider/jstree/jsonList.do",
	       dataType : "json",    
	
	       success : function(json) {
	           
	       	//var data = JSON.stringify(json.list);
	       	//alert('data :'+data);
	       	
		    $("#using_json").jstree({
		        "core" : {
		            "data" : json.list,
		            check_callback: true 
		        },
		        "plugins" : [ "themes", "json_data", "ui" ,"dnd", "checkbox", "search" ]
		        
		    });
		    
	       },    
	
	       error : function(xhr, ajaxOptions, thrownError) {
	           alert(xhr.status);
	           alert(thrownError);
	       }
	}); 
	   

	/*     $('#using_json').jstree({ 'core' : {
	        'data' : [
	           { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
	           { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
	           { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
	           { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
	        ]
	    } });
	*/

   
   
   //jsTree event
   //event 
   
   //select event.
	$("#using_json").bind("select_node.jstree", function(evt, data){
       	 var i, j, r = [], ids=[];
       	    for(i = 0, j = data.selected.length; i < j; i++) {
       	      r.push(data.instance.get_node(data.selected[i]).text);
       	      ids.push(data.instance.get_node(data.selected[i]).id);
       	    }
       	    $('#event_result').html('Selected: ' + r.join(', '));
       	    $('#event_result2').html('Selected: ' + ids.join(', '));
       }
	);
   
   //add button.
    $("#btnAdd").click(function() {
       	var parent = $('#using_json').jstree('get_selected');
    	var node = {id:"123",text:"Hello world"};
    	$('#using_json').jstree(true).create_node(parent, node);
    	$('#using_json').jstree(true).open_all();
    	
    });
    
   //delete button.
    $("#btnDelete").click(function() {
    	var ref = $('#using_json').jstree(true);
		var sel = ref.get_selected();
		if(!sel.length) { return false; }
		ref.delete_node(sel);
    });
 
   //rename button.
    $("#btnRename").click(function(e, obj) {
    	var ref = $('#using_json').jstree(true);
		var sel = ref.get_selected();
		if(!sel.length) { return false; }
		sel = sel[0];
		ref.edit(sel);
		
		var getJson = ref.get_json(sel, 'options.flat, options.no_children');
		var jsonData = JSON.stringify(getJson);
		//alert("jsonData :" +jsonData);
    });
    
    //rename event 
	$("#using_json").bind("rename_node.jstree", function(evt, data){
		var jsonData = JSON.stringify(data);
		alert('rename node jsonData: ' + jsonData);
		alert('data.node.id :' + data.node.id+' data.node.text :' + data.node.text+' data.node.parent :' + data.node.parent);
		//have to update db.
	  	} 
	);

    //create event.
	$("#using_json").bind("create_node.jstree", function(evt, data){
		var jsonData = JSON.stringify(data);
		alert('create_node  jsonData: ' + jsonData);
		alert('data.node.id :' + data.node.id+' data.node.text :' + data.node.text+' data.node.parent :' + data.node.parent);
		//have to update db.
	  	} 
	);

    //delete event.
	$("#using_json").bind("delete_node.jstree", function(evt, data){
		var jsonData = JSON.stringify(data);
		alert('delete_node  jsonData: ' + jsonData);
		alert('data.node.id :' + data.node.id+' data.node.text :' + data.node.text+' data.node.parent :' + data.node.parent);
		//have to update db.
	  	} 
	);
	
    //move event.
	$("#using_json").bind("move_node.jstree", function(evt, data){
		var jsonData = JSON.stringify(data);
		alert('move_node  jsonData: ' + jsonData);
		alert('data.node.id :' + data.node.id+' data.node.text :' + data.node.text+' data.node.parent :' + data.node.parent);
		//have to update db.
	  	} 
	);
	
	//change event.
	$("#using_json").bind("changed.jstree", function(evt, data){
	    var path = data.instance.get_path(data.node,'/');
		alert('path : ' + path);
		
	  	} 
	);
	
	//serach tree.
	var to ='';
	 $('#searchText').keyup(function () {
		    if(to) { clearTimeout(to); }
		    to = setTimeout(function () {
		      var v = $('#searchText').val();
		      $('#using_json').jstree(true).search(v);
		    }, 250);
	 });
});

</script>
</head>
<body>
 <div class="container">
<div class="page-header">
	<h3>jsTree Test</h3>
</div>

<div>
	<h5>JsTree Test</h5>
	<!-- <div id="tree"></div>-->
	 <div id="using_json"></div>
	 <div id="event_result"></div>
	 <div id="event_result2"></div>
	 <button id="btnRename">rename</button>
	 <button id="btnAdd">add</button>
	 <button id="btnDelete">delete</button>
	 <input id="searchText">
</div>
</div>
</body>
</html>