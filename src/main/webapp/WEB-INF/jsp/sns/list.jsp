<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="${pageContext.request.locale}">
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type='text/css'>
   <![CDATA[ 
    #file-input-wrapper {
    	display : none ;
    	margin-top : 50px ;
    }
   ]]>
</style>


<script type="text/javascript">
$(document).ready(function() {
	
   
  	
	$('#btnKakao').click(function() {
/*  	    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('2bf8764f0b7bb1a724cda0d35f580b02');
	    // // 카카오톡 링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	    Kakao.Link.createTalkLinkButton({
	      container: '#kakao-link-btn',
	      label: '카카오링크 샘플에 오신 것을 환영합니다.',
	      image: {
	        src: 'http://dn.api1.kage.kakao.co.kr/14/dn/btqaWmFftyx/tBbQPH764Maw2R6IBhXd6K/o.jpg',
	        width: '300',
	        height: '200'
	      },
	      webButton: {
	        text: '카카오 디벨로퍼스',
	        url: 'https://dev.kakao.com/docs/js' // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
	      }
	    }); 
	    
	     */
	    
	    //<![CDATA[
	    // Set JavaScript Key of current app.
	    Kakao.init('2bf8764f0b7bb1a724cda0d35f580b02');
	    function sendLink() {
	      Kakao.Link.sendTalkLink({
	        label: '안녕하세요, 꽃다운 ' + Math.floor(Math.random()*(70)+ 15) + '살 개발자입니다.'
	      });
	    }
	  //]]>
	}); 	
	
	

	var sendSns= function (sns, url, txt){
	    var obj;
	    var _url = encodeURIComponent(url);
	    var _txt = encodeURIComponent(txt);
	    var _br  = encodeURIComponent('\r\n');
	    var appName = encodeURIComponent('');
	
	    if(sns =='f'){ //facebook
            obj = {
                method:'popup',
                url:'http://www.facebook.com/sharer/sharer.php?u=' + _url
		    };
	    	
	    }else if(sns =='t'){ //twitter
			obj = {
				method:'popup',
				url:'http://twitter.com/intent/tweet?text=' + _txt + '&url=' + _url
			};
	    	
	    }else if(sns =='k'){ //kakaotalk
            obj = {
                method:'web2app',
                param:'sendurl?msg=' + _txt + '&url=' + _url 
		               + '&type=link&apiver=2.0.1&appver=2.0&appid=dev&appname=' + appName,
                a_store:'itms-apps://itunes.apple.com/app/id362057947?mt=8',
                g_store:'market://details?id=com.kakao.talk',
                a_proto:'kakaolink://',
                g_proto:'scheme=kakaolink;package=com.kakao.talk'
		      };
	    }
	
	    if('popup' == obj.method){
	          //  window.open(obj.url);
				document.location.href=obj.url;
	   }else if('web2app' == obj.method ){
            if(navigator.userAgent.match(/android/i)){
	                // Android
	                setTimeout(function(){ 
						location.href = 'intent://' + obj.param + '#Intent;' + obj.g_proto + ';end'
					}, 100);
	            }else if(navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)){
	                // Apple
	                setTimeout(function(){
						location.href = obj.a_store;
					}, 200);          
	                setTimeout(function(){ 
						location.href = obj.a_proto + obj.param 
					}, 100);
	            }else{
	                alert('이 기능은 모바일에서만 사용할 수 있습니다.');
	            }	
		}
	};
	
	$('#btnfacebook').click(function() {
		var PAGE_URL ='http://localhost:8080/sns/list.do';
		var text ='text';
		sendSns('f',PAGE_URL, text);
	}); 	
	
	$('#btnTwitter').click(function() {
		var PAGE_URL ='http://localhost:8080/sns/list.do';
		var text ='text';
		sendSns('t',PAGE_URL, text);
	}); 	

/* 	$('#btnKakao').click(function() {
		var PAGE_URL ='http://localhost:8080/sns/list.do';
		var text ='text';
		sendSns('k',PAGE_URL, text);
	}); 	
 */	
	
	
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