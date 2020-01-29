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
                        <input type="text" name="id" style="width: 40%; padding: 2px; margin: 13px;" placeholder="아이디를 입력해주세요.">
                </div>
                <div class="b_genre">
                    <input type="password" name="pw" style="width: 40%; padding: 2px; margin: 13px;" placeholder="비밀번호를 입력해주세요.">
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

})



</script>


</html>
