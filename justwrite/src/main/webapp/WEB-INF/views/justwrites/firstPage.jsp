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

        <!-- 헤더 부분 -->
<%@include file = "../includes/header.jsp" %>           
            <!-- 헤더 부분 끝-->


            <!-- 컨텐츠 표시 영역 -->

            <div class="content_area">
                <div class="content_name"><p>현재 작성 중인 글 [${bookCount}]</p></div>
                <div class="book_list">

		              <c:forEach items="${bookList}" var="getList">
		                    <div class="book1">
		                        <div class="book_img">
		                            <img src='<c:out value="${getList.bookCover }" />'>
		                        </div>
		                            <div class="title_area">
				                                        <div class="title_line">
				                          <c:out value="${getList.bookName }" />
				                            <span class="updateDate" style="float: right;">
				                                <c:out value="${getList.bookGenre }" />
				                            </span>
		                            </div>
		                            <div class="book_line">
		                         	<c:out value="${getList.bookEx }" />
		                            </div>
		                         </div>
		                    </div>
		          </c:forEach>
                     
               


                </div>
                
             </div>
             

          <!-- 컨텐츠 표시 영역 끝-->
</div>

</body>
<script>
$(document).ready(function(){
    info();
    infoHide();
})

function info(){
    $(".myinfo").click(function(){
        $(".dropBox").show();
    })
}


function infoHide(){
    $('html').click(function(e) { 
        if(!$(e.target).hasClass("myinfo")){

            $(".dropBox").hide();
            } 
        });



}

</script>





</html>
