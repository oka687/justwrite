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
      <link rel="stylesheet" type="text/css" href="/resources/css/makeNovel.css" />
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  
</head>
<body>
         <!-- 헤더 부분 -->
<%@include file = "../includes/header.jsp" %>           
            <!-- 헤더 부분 끝-->
  
   
     
  <form role="form" action="/justwrites/novelWrite" method="post" enctype="multipart/form-data"> 
    <div class="makeContainer">
        <div class="headArea">
            <p class="headText">새 글 쓰기</p>
        </div>

        <ul class="makeBox">
            <li>
                <input type="text" name="bookName"  class="nameInput" placeholder="글 제목">
            </li>
            <li>
                <input type="text" name="bookGenre" class="nameInput" placeholder="장르">
            </li>
            <li style="height: 50%;">
                <textarea id="novelEx" name="bookEx" cols="30" rows="5" placeholder="소개문"></textarea>
            </li>
            <li style="border-top: 1px solid #ebebeb; margin-top: 5%;">
                <input type="file" class="inputFile" name='uploadFile' >
            </li>

            </ul>
            <div class="button_area">
                <button type="submit" class="submit_button">확인</button>
                <button type="button" class="cancle_btn">취소</button>
            </div>
          
        </div>
     
           
   </form> 
          <!-- 컨텐츠 표시 영역 끝-->


</body>
<script>




</script>





</html>
