<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>JustWrite</title>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="/resources/js/firstPage.js" ></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/firstPage.css" />
</head>
<body>
 <div class="bg" style="width: 100%; height: 100%;">

        <div class="login_form" style="width: 50%; margin: auto;  text-align: center;">
            <div class="logo_write" style="font-size: 50px; padding: 10px;">
                JustWrite
            </div>

            <div id="user_id" style="margin: 10px;">
                <input type="text" style="width: 50%; height: 50px; padding: 3px; cursor: pointer; font-size: 30px;" placeholder="아이디">
            	
            </div>
            <div id="user_pw" style="margin: 10px;">
                <input type="password" style="width: 50%; height: 50px; padding: 3px; cursor: pointer; font-size: 30px;" placeholder="비밀번호">
			
            </div>
            <button type="submit" style="margin-top: 2%;">로그인</button>
            <button type="submit" id="registUser" style="margin-top: 2%;">회원가입</button>
        </div>
        
	  <form role="form" action="/justwrites/regist" method="post"> 
        <div class="add_bg">
      
            <div class="add_main">
                <div class="b_title">
                    <span class="close_button" style="position: fixed; left: 84%; font-weight: bold; cursor: pointer;">X</span><br>
                        <input type="text" id = "userid" name="id" style="width: 40%; padding: 2px; margin: 13px;" placeholder="아이디를 입력해주세요.">
						 <input type="hidden" id = "idchecker" style="width: 40%; padding: 2px; margin: 13px;" value="0">
               			<button id="idcheck">아이디 확인</button>
						 <h3 class="idText" style="margin: 0;"></h3>
                </div>
                <div class="b_genre">
                    <input type="password" class="pwcheck" id="pw" name="pw" style="width: 40%; padding: 2px; " placeholder="비밀번호를 입력해주세요.">
                    <br>
                	<input type="password" class="pwcheck" id="pcheck" style="width: 40%; padding: 2px; " placeholder="비밀번호 재확인">
            		<h3 class="palert" style="margin: 0;"></h3>
                </div>
                <div class="b_genre">
                    <input type="text" name="nickName" style="width: 40%; padding: 2px; margin: 13px;" placeholder="닉네임을 입력해주세요.">
                </div>
                <div class="b_genre">
                    <input type="text" name="eMail" style="width: 40%; padding: 2px; margin: 13px;" placeholder="이메일을 입력해주세요.">
                </div>
                    <button type="submit" style="margin-top: 2%;">가입</button>
            </div>
    
        </div>
	 	</form> 

    </div>
</body>
<style>
    body{
        margin: 0;
        padding: 0;
    }



</style>

<script type="text/javascript">
$(document).ready(function(){
	
	
    $('#registUser').click(function(){
        $('.add_bg').show();
		
    })
    
    
    	/* 아이디체크 시작 */
    $('#idcheck').click(function(){
		var userid = $('#userid').val();
		$('#userid').keyup(function(){
	 		$('#idchecker').val("0");
	 		$('.idText').text("아이디를 확인해주세요.").css("color","red");
	 	})
		
		$.ajax({
		    url:'/request/idcheck',
		    type:'POST',
		    data:{"id" : userid}, //보낼 데이터
		    success: function(data) {
		    	console.log(data);
		    	if(data == "success"){
		    	 	alert("사용할 수 있습니다.")
		    	 	$('#idchecker').val("1");
		    	 	$('.idText').text("사용할 수 있는 아이디입니다.").css("color","blue");
		    	}
		    	
		    	if(data == "fail"){
		    		alert("이미 사용 중인 아이디입니다. 다시 입력해주세요.")
		    	}
		    },
		    error: function(err) {
		    	console.log(err);
		    	
		    }
		});

			
		return false; //이벤트 전파를 막기 위한 코드. e.preventDefault(); 대체 가능
    })
    /* 아이디체크 끝 */
    
    
   (function(e){
   		$('.pwcheck').keyup(function(){
   			
   			
   			
   	    	var pw = $("#pw").val();
   	    	var pcheck = $("#pcheck").val();
   	    	  		
   	   	 if(pw.length == 0 && pcheck.length == 0){
	    		$(".palert").empty();
	    	}else if(pw == pcheck){
   	    		$(".palert").text("비밀번호가 일치합니다.").css("color","blue");
   	    	}else{
   	    		$(".palert").text("비밀번호가 일치하지 않습니다").css("color","red");
   	    	}
   	    	
   			
   		})
   		e.preventDefault();
		return false;
    }());
    
    

})


</script>


</html>
