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
    	var url = '/ubi/sns/list.do';
       $("#searchForm").attr("action", '<c:url value="'+url+'"/>');
       $("#searchForm").submit();
    };
	$('#btnSearch').click(function() {
		search();
		
		
	}); 	
	
	//http://dev.epiloum.net/916
	
	
	
	$('#btnfacebook').click(function() {
	
		var PAGE_URL ='http://localhost:8080/sns/list.do';
		var url ='http://www.facebook.com/sharer/sharer.php?u='+PAGE_URL;
		
		document.location.href=url;
	}); 	
	
	
	
	$('#btnTwitter').click(function() {
		
		var PAGE_URL ='http://localhost:8080/sns/list.do';
		var url ='https://twitter.com/intent/tweet?text=TEXT&url='+PAGE_URL;
		document.location.href=url;
	}); 	
	
	
	
	
	$('#btnKakao').click(function() {

		
		
		
		var param = 'sendurl?msg=' + encodeURIComponent('보낼 메시지');
	    param += '&url=' + 'http://localhost:8080/sns/list.do';
	    param += '&type=link';
	    param += '&apiver=2.0.1';
	    param += '&appver=2.0';
	    param += '&appid=dev.epiloum.net';
	    param += '&appname=' + encodeURIComponent('Epiloum 개발노트');
	 
	if(navigator.userAgent.match(/android/i)){
	    setTimeout(function(){
	        location.href = 'intent://' + param + '#Intent;package=com.kakao.talk;end';
	    }, 100);
	}else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)){
	    setTimeout(function(){
	        location.href = 'itms-apps://itunes.apple.com/app/id362057947?mt=8';
	    }, 200);
	    setTimeout(function(){
	        location.href = 'kakaolink://' + param;
	    }, 100);
	}
	
	   location.href = 'intent://' + param + '#Intent;package=com.kakao.talk;end';
	
	}); 	
	


	
});
</script>
</head>
<body>
 <div class="container">
<div class="page-header">
	<h3>sns test</h3>
</div>
<button type="button" id="btnKakao">kakao</button>
<button type="button" id="btnfacebook">facebook</button>
<button type="button" id="btnTwitter">twitter</button>


	
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


		
		</tbody>
	</table>
</div>	
</div>

	<form id='searchForm' name="searchForm" method="post" action="" class="form-inline" role="form">
		<input type="hidden" name="memberNo" id="memberNo" value="0" />
	</form>

</body>
</html>