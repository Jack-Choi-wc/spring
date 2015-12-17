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
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<c:url value="/jqueryui/jquery-ui.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jqgrid/js/jquery.jqGrid.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jqgrid/js/i18n/grid.locale-en.js"/>"></script>

<script type="text/javascript">
$(document).ready(function() {

	$("#list").jqGrid({
		url: '/spider/jqgrid/jsonList.do',
		datatype: "json",
		height: 350,
	   	colNames:['Inv No','MemberNo', 'Name', 'UpdateId','UpdateDt'],
	   	colModel:[
	   		{name:'memberNo',index:'memberNo', width:80},
	   		{name:'name',index:'name', width:100},
	   		{name:'email',index:'email', width:80, align:"right"},
	   		{name:'updateId',index:'updateId', width:80,align:"right" ,sortable:false},		
	   		{name:'updateDt',index:'updateDt', width:150, sortable:false}		
	   	],
	   	multiselect: true,
   		rowNum:10,
   	   	rowList:[10,20,30],
	   	caption: "json Data",
	   	pager: '#pager2',
	    viewrecords: true,
	    sortorder: "desc"
	});	
	$("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});
});

</script>
</head>
<body>
 <div class="container">
<div class="page-header">
	<h3>jqGrid Json List</h3>
</div>
<button type="button" id="btnSearch">Search</button>	
<div>
	<h5>json List</h5>
	<table id="list"></table>
	<div id="pager2"></div>
</div>	
</div>

</body>
</html>