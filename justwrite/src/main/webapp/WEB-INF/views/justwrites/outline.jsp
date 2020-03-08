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
    <link rel="stylesheet" type="text/css" href="/resources/css/outline.css" />
</head>
<body>
        <!-- 헤더 부분 -->
<%@include file = "../includes/header.jsp" %>           
            <!-- 헤더 부분 끝-->
            
            <!-- 컨텐츠 표시 영역 -->
            <div class="bookCage">

                <ul class="dir">
                    <span class="dirBox" style="width: 10%;">/블러디테일</span>
                    <span class="dirBox" style="width: 10%;">/선역</span>
                    <span class="dirBox" style="width: 10%;">/다크로지스틱스</span>
                </ul>
                <ul class="back">
                    <li class="backBar">..</li>
                </ul>
               
                    <ul class="bookList">
                            <li class="lno" style="width: 4%;">
                                <img src="/resources/img/folder.png">
                            </li>
                            <li class="bname" style="width: 30%;margin-left: 5px;">블러디테일</li>
                            <li class="chapCount" style="width: 40%;">특이사항</li>
                            <li class="regDate" style="width: 14%; text-align: center;">2017-10-10</li>
                            <button class="dbutton" style="left: 3%;position: relative;">삭제</button>    
                    </ul>
                    <ul class="bookList">
                        <li class="lno" style="width: 4%;">
                            <img src="/resources/img/file.png">
                        </li>
                        <li class="bname" style="width: 30%;margin-left: 5px;">강태일</li>
                        <li class="chapCount" style="width: 40%;">특이사항</li>
                        <li class="regDate" style="width: 14%; text-align: center;">2017-10-10</li>
                        <button class="dbutton" style="left: 3%;position: relative;">삭제</button>    
                </ul>
  
            </div>

        <!-- 컨텐츠 표시 영역 끝-->


     

</body>
</html>
