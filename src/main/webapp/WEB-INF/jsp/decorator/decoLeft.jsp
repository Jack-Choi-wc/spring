<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>

<%-- <%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:setCurrentTopMenu menuId="${param.topMenuId}" />
 --%>
<script type="text/javascript">
$(document).ready(function() {
});
</script>
<c:if test="${empty param.leftMenuId}">
    <c:set var="leftMenuId" value="${topMenu.childMenus[0].menuId}"/>
</c:if>
<c:if test="${!empty param.leftMenuId}">
    <c:set var="leftMenuId" value="${param.leftMenuId}"/>
</c:if>
<div id="snb">
    <ul>
    <c:forEach var="childMenu" items="${topMenu.childMenus}" varStatus="j">
        <li><a href="<c:url value="${childMenu.menuUrl}?topMenuId=${param.topMenuId}&leftMenuId=${childMenu.menuId}"/>" 
        <c:if test="${childMenu.menuId == leftMenuId}">class="on"</c:if> >${childMenu.menuName}</a></li>
    </c:forEach>
    </ul>
</div>

