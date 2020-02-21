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
  
   
   <div class="makeContainer">
        <div class="headArea">
            <p class="headText">새 글 쓰기</p>
        </div>

        <ul class="makeBox">
            <li>
                <input type="text" name="bookName" id="bookName" class="nameInput" placeholder="글 제목">
            </li>
            <li>
                <input type="text" name="bookGenre" id="bookGenre" class="nameInput" placeholder="장르">
            </li>
            <li style="height: 50%;">
                <textarea id="bookEx" name="bookEx" cols="30" rows="5" placeholder="소개문"></textarea>
            </li>
            <li style="border-top: 1px solid #ebebeb; margin-top: 5%;">
                <input type="file" class="inputFile" name='uploadFile' id="uploadFile" >
            </li>

            </ul>
            <div class="button_area">
                <button type="submit" id="submit_btn" class="submit_button">확인</button>
                <button type="button" class="cancle_btn">취소</button>
            </div>

        </div>
     

          <!-- 컨텐츠 표시 영역 끝-->


</body>
<script>
$(document).ready(function(){
	
	imgUpload();
	
})
function checkFile(fileName, fileSize){
	
	var maxSize = 5242880; //5MB
	
	
	var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
  	if(fileName.match(reg)) {
  		if(fileSize > maxSize){
  			alert("이미지 용량이 5MB를 초과했습니다.")
  			return false;
  		}
		return true;
	} else {
		alert("해당 파일은 이미지 파일이 아닙니다.");
		$("#uploadFile").val("");
		return false;
	}
	
}
function imgUpload(){
	
	$("#submit_btn").click(function(){
		
		var novelName = $("#bookName").val();
		var novelGenre = $("#bookGenre").val();
		
		
		var text = document.getElementById('bookEx').value;
		console.log(text);
		var novelEx = text.replace(/(\n|\r\n)/g, '<br>');
		
		
		
		
	    var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		console.log(inputFile);
	
	var files = inputFile[0].files;
	
	console.log(files.length);
	
	
	
	
	
	if(files.length >= 1){
		if(!checkFile(files[0].name,files[0].size)){
			return false;
			}
		
		
			formData.append("bookName", novelName);
			formData.append("bookGenre", novelGenre);
			formData.append("bookEx", novelEx);
			formData.append("uploadFile", files[0]);
		
				$.ajax({
				
					url:'/request/novelWrite',
					enctype: 'multipart/form-data',
					processData: false,
				    contentType: false,
				    data: formData,
				    type:'POST',
			
				    success:function(result){
				    	
				    	if(result == "fail"){
				    		alert("이미 사용하신 제목입니다.")
				    	}else{
				    		alert("업로드 성공");
				    		location.replace("http://localhost:8080/justwrites/firstPage");
				    	}
				    	
				    }
				    	
				    
				});
		
	
	}else{
		
		
		formData.append("bookName", novelName);
		formData.append("bookGenre", novelGenre);
		formData.append("bookEx", novelEx);
	
			$.ajax({
			
				url:'/request/novelWrite',
				enctype: 'multipart/form-data',
				processData: false,
			    contentType: false,
			    data: formData,
			    type:'POST',
		
			    success:function(result){
			    	
			    	if(result == "fail"){
			    		alert("이미 사용하신 제목입니다.")
			    	}else{
			    		alert("업로드 성공");
			    		location.replace("http://localhost:8080/justwrites/firstPage");
			    	}
			    	
			    }
			    	
			    
			});
		
		
		
		
	}
	
		
	});
	
	
}
</script>