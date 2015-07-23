<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="datePattern"><spring:message code="date.format"/></c:set>
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hey</title>
	
	<%-- <link href='${pageContext.request.contextPath}/css/admin.css' rel="stylesheet" type="text/css" />
	<link href='${pageContext.request.contextPath}/css/button.css' rel="stylesheet" type="text/css" />
     --%>
    
<%--
   <link rel="stylesheet" type="text/css" media="screen" href="<c:url value='/css/smoothness/jquery-ui-1.9.2.custom.min.css'/>" />
     <script src="<c:url value='/js/jquery-1.7.2.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/jquery-ui-1.9.2.custom.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/ui.datepicker-ko.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/js/common.js'/>" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
 --%>    
    
    <decorator:head />
</head>

<body>
    <div id="wrap">
        <!--header -->
        <page:applyDecorator name="decoTop"/>
        <!--//header -->

        <!--container -->
        <div id="container">
            <!--snb -->
            <!--왼쪽메뉴 시작-->
            <page:applyDecorator name="decoLeft"/>
            <!--왼쪽메뉴 끝-->
            <!--//snb -->

            <div class="column_content">
                <!--content -->
                <div id="content">
                <!-- content -->
                <decorator:body />
                </div>
                <!--//content -->
            </div>
            <!--//container -->
        </div>
        <!--footer -->
        <page:applyDecorator name="decoBottom"/>
        <!--//footer -->
    </div>
</body>
</html>
