<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>

<%-- <c:set var="datePattern">
	<spring:message code="date.format" />
</c:set>

 --%>
 <script type="text/javascript">
</script>

<div id="header">
	<h1>
		<a href="#">Hey</a>
	</h1>
	<ul class="lnb">
		<c:forEach var="menu" items="${userMenu.childMenus}" varStatus="i">
			<li <c:if test='${menu.menuId eq param.topMenuId }'>class="on"</c:if>><a
				href="<c:url value='${menu.menuUrl}?topMenuId=${menu.menuId}'/>">${menu.menuName}</a></li>
		</c:forEach>
	</ul>
	<ul class="topmenu">
		<li>${USER_SESSION.id}</li>
		<li><a href="">LOGOUT&gt;&gt;</a></li>
	</ul>
</div>
