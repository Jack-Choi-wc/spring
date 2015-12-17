<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="${pageContext.request.locale}">
<head>

<link href="<c:url value="/jqueryui/jquery-ui.css" />" media="screen" rel="stylesheet">
<link href="<c:url value="/jqgrid/css/ui.jqgrid.css" />" media="screen" rel="stylesheet">

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript" src="<c:url value="/jqueryui/jquery-ui.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jqgrid/js/i18n/grid.locale-en.js"/>"></script>
<script type="text/javascript" src="<c:url value="/jqgrid/js/jquery.jqGrid.min.js"/>"></script>


<script type="text/javascript">
$(document).ready(function() {


	$("#list").jqGrid({
		datatype: "local",
		height: 250,
	   	colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
	   	colModel:[
	   		{name:'id',index:'id', width:60, sorttype:"int"},
	   		{name:'invdate',index:'invdate', width:90, sorttype:"date"},
	   		{name:'name',index:'name', width:100},
	   		{name:'amount',index:'amount', width:80, align:"right",sorttype:"float"},
	   		{name:'tax',index:'tax', width:80, align:"right",sorttype:"float"},		
	   		{name:'total',index:'total', width:80,align:"right",sorttype:"float"},		
	   		{name:'note',index:'note', width:150, sortable:false}		
	   	],
	   	multiselect: true,
	   	caption: "Manipulating Array Data"
	});
	var mydata = [
			{id:"1",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
			{id:"2",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
			{id:"3",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
			{id:"4",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
			{id:"5",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
			{id:"6",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
			{id:"7",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
			{id:"8",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
			{id:"9",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"}
			];
	for(var i=0;i<=mydata.length;i++)
		$("#list").jqGrid('addRowData',i+1,mydata[i]);
	
});

</script>
</head>
<body>
 <div class="container">
<div class="page-header">
	<h3>차 위치 조회</h3>
</div>
<button type="button" id="btnSearch">Search</button>	
<div>
	<h5>미션현황</h5>
	<table id="list">
	</table>
</div>	
</div>



</body>
</html>