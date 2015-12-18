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

	$('#using_json').jstree({ 'core' : {
	    'data' : [
	       'Simple root node',
	       {
	         'text' : 'Root node 2',
	         'state' : {
	           'opened' : true,
	           'selected' : true
	         },
	         'children' : [
	           { 'text' : 'Child 1' },
	           'Child 2'
	         ]
	      }
	    ]
	} });
	
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
	<div id="using_json"></div>
</div>	
</div>

</body>
</html>