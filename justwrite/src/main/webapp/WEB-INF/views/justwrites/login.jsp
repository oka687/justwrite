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
                <input type="text" id="login_id" style="width: 50%; height: 50px; padding: 3px; cursor: pointer; font-size: 30px;" placeholder="아이디">
            	
            </div>
            <div id="user_pw" style="margin: 10px;">
                <input type="password" id="login_pw" style="width: 50%; height: 50px; padding: 3px; cursor: pointer; font-size: 30px;" placeholder="비밀번호">
				<h3 class="loginForm"></h3>
            </div>
            <button id="logincheck" style="margin-top: 2%;">로그인</button>
           
            <button type="submit" id="registUser" style="margin-top: 2%;">회원가입</button>
        </div>
        
	  <form role="form" action="/justwrites/regist" method="post" onsubmit="return check()"> 
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
            		 <input type="hidden" id = "pwchecker" style="width: 40%; padding: 2px; margin: 13px;" value="0">
            		<h3 class="palert" style="margin: 0;"></h3>
                </div>
                <div class="b_genre">
                    <input type="text" id="nick" name="nickName" style="width: 40%; padding: 2px; margin: 13px;" placeholder="닉네임을 입력해주세요.">
                	<button id="nickcheck">닉네임 확인</button>
                	<br>
                	 <h3 class="nickText" style="margin: 0;"></h3>
                	 <input type="hidden" id = "nickchecker" style="width: 40%; padding: 2px; margin: 13px;" value="0">
                </div>
                <div class="b_genre">
                    <input type="text" id="eMailCheck" name="eMail" style="width: 40%; padding: 2px; margin: 13px;" placeholder="이메일을 입력해주세요.">
                	<input type="hidden" id = "emailchecker" style="width: 40%; padding: 2px; margin: 13px;" value="0">
                	  <h3 class="emailText" style="margin: 0;"></h3>
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
	/* 비밀번호 체크 즉시실행함수 시작*/
	   (function idChecker(){
		   event.stopPropagation();
	   		$('.pwcheck').keyup(function(event){
	   			
	   	    	var pw = $("#pw").val();
	   	    	var pcheck = $("#pcheck").val();
	   	    	  		
	   	   	 if(pw.length == 0 && pcheck.length == 0){
		    		$(".palert").empty();
		    	}else if(pw == pcheck){
	   	    		$(".palert").text("비밀번호가 일치합니다.").css("color","blue");
	   	    		$('#pwchecker').val("1");
	   	    	}else{
	   	    		$(".palert").text("비밀번호가 일치하지 않습니다").css("color","red");
	   	    		$('#pwchecker').val("0");
	   	    	}
	   	    	
	   			
	   		})
	   		
	  
	    }());
	   /* 비밀번호 체크 끝 */
	$("#logincheck").click(function(){
		 
		
		var loginId = $("#login_id").val();
		var loginPw = $("#login_pw").val();

		
		$.ajax({
		    url:'/request/loginp',
		    type:'POST',
		    dataType:'text',
		    contentType : "application/json; charset=utf-8",
		    data:JSON.stringify(
		    		  {"id" : loginId,
		  		    	"pw" : loginPw}
		    		), 
		    success: function(data) {
		    	
		    	if(data == "success"){
		    		//alert("성공");
		    		location.replace("http://localhost:8080/justwrites/check");
		    	}
		    	
		    	if(data == "fail"){
		    	
		    		$('.loginForm').text("일치하지 않는 정보입니다. 아이디와 비밀번호를 확인해주세요.").css("color","red");
		    	}
		    },
		    error: function(err) {
		    	console.log(err);				    	
		    }
		});			
	})
		

	
	   
	   /* 비밀번호,text 확인 엔터 막기 시작*/
	   $('input[type="password"]').keydown(function() {
		   if (event.keyCode === 13) {
		     event.preventDefault();
		   };
		 });
	   $('input[type="text"]').keydown(function() {
		   if (event.keyCode === 13) {
		     event.preventDefault();
		   };
		 });
	   /* 비밀번호 확인 엔터 막기 끝*/
	
	
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
		 
		    	 	$('#idchecker').val("1");
		    	 	$('.idText').text("사용할 수 있는 아이디입니다.").css("color","blue");
		    	}
		    	
		    	if(data == "fail"){
		    		$('.idText').text("이미 사용 중인 아이디입니다. 다시 입력해주세요.").css("color","red");
		    	}
		    },
		    error: function(err) {
		    	console.log(err);
		    	
		    }
		});

			
		return false; //이벤트 전파를 막기 위한 코드.
    })
    /* 아이디체크 끝 */
   
     /* 닉네임 체크 시작 */
    $("#nickcheck").click(function(){
    	  event.stopPropagation();
    	  
    	  var userid = $('#nick').val();
  		$('#nick').keyup(function(){
  	 		$('#nickchecker').val("0");
  	 		$('.nickText').text("닉네임을 확인해주세요.").css("color","red");
  	 	})
    	  
    	var nick = $("#nick").val();
    	
    	$.ajax({
		    url:'/request/nickcheck',
		    type:'POST',
		    data:{"nick" : nick}, //보낼 데이터
		    success: function(data) {
		    	
		    	if(data == "success"){
		    		$('#nickchecker').val("1");
		    	 	$('.nickText').text("사용할 수 있는 닉네임입니다.").css("color","blue");
		    	}
		    	
		    	if(data == "fail"){
		    	 	$('.nickText').text("이미 등록된 닉네임입니다. 다시 입력해주세요").css("color","red");
		    	}
		    },
		    error: function(err) {
		    	console.log(err);
		    	
		    }
		});

			
		return false; //이벤트 전파를 막기 위한 코드.
    })
    	
    /* 닉네임 체크 끝 */
    
     /* 이메일 체크 */
    $("#eMailCheck").keyup(function(){
    
    	var email = $("#eMailCheck").val();
    	
    	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	
    	if(email.match(regExp) != null){
    		$(".emailText").empty();
    		$("#emailchecker").val("1");
    	}else{
    		$(".emailText").text("이메일 형식에 맞지 않습니다.").css("color","red");
    		$("#emailchecker").val("0");
    	} 
    	
    	return false;
    })
    /* 이메일 체크 끝*/
    
    	
   })
   
    function check(){
    	var idcheck = $('#idchecker').val();
    	var pwcheck = $('#pwchecker').val(); 	
    	var nickcheck = $('#nickchecker').val();
    	var emailcheck = $('#emailchecker').val();
    	
    	if(idcheck == "1" && pwcheck == "1" && nickcheck == "1" && emailcheck == "1"){
    		alert("회원가입에 성공하였습니다.")
    		return true;
    	}else if(idcheck || "1" && pwcheck || "1" && nickcheck || "1" && emailcheck || "1"){
    			
    			alert("틀린 곳이 있는지 다시 확인해주십시오.")
				 return false;
    	}
    	
    
  
    
}
    
    
    
    
    
    




</script>


</html>
