<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="${pageContext.request.locale}">
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
    var search = function() {
    	var url = '/ubi/member/list.do';
       $("#searchForm").attr("action", '<c:url value="'+url+'"/>');
       $("#searchForm").submit();
    };
	$('#btnSearch').click(function() {
		search();
	}); 	
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
	<table id="tableBody">
    <colgroup>
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="" />
    </colgroup>
    <thead>
      <tr>
        <th>멤버번호</th>
        <th>이름</th>
        <th>이메일</th>
        <th>업데이트아이디</th>
        <th>업데이트날짜</th>
       </tr>
    </thead>
   	<tbody>
			<c:forEach var="item" items="${list}" varStatus="status">
				<tr style="text-align:center;">
		 			<td>${item.memberNo}</td>
 		 			<td>${item.email}</td>
		 			<td>${item.updateId}</td>
		 			<td><fmt:formatDate pattern="yyyy-MM-dd  HH:mm:ss" value="${item.updateDt}"/></td>
 	 			</tr>
 			</c:forEach>
		
		</tbody>
	</table>
</div>	
</div>

	<form id='searchForm' name="searchForm" method="post" action="" class="form-inline" role="form">
		<input type="hidden" name="memberNo" id="memberNo" value="0" />
	</form>

</body>
</html>