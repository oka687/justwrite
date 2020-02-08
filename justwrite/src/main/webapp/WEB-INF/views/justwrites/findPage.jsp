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
    <link rel="stylesheet" type="text/css" href="/resources/css/findpage.css" />
   
</head>
<body>
        <!-- 헤더 부분 -->
<%@include file = "../includes/header.jsp" %>           
            <!-- 헤더 부분 끝-->
     <!-- 컨텐츠 표시 영역 -->
            <div class="content_area">
                <div class="book_list">
                    <div class="book1">
                        <div class="book_img">
                            <img src='/resources/img/ex.jpg'>
                        </div>
                            <div class="title_area">
                                        <div class="title_line">
                            데댕라랑 댕라 [3]
                            <span class="updateDate" style="float: right;">
                                2017/01/11
                            </span>
                            </div>
                            <div class="book_line">
                                댕라랑 대댕라의 사이 좋은 이야기가 있습니다
                                댕라랑 대댕라의 사이 좋은 이야기가 있습니다
                                댕라랑 대댕라의 사이 좋은 이야기가 있습니다
                            </div>
                         </div>
     
                    </div>


                    <div class="chapList">
                        <ul class="chapBox">
                            <li class="chap_line">
                                <span class="blank"></span>
                                <div class="bookInfo">
                                    <p class="chapName">프롤로그</p>
                                    <p class="chapInfo">
                                        <span class="fixButton">
                                            수정
                                        </span>
                                        <span class="chapText">
                                            글자수 5000
                                        </span>
                                        <span class="chapText">
                                            2017/10/10
                                        </span>
                                    </p>
                                </div>    
                             </li>
                             <li class="chap_line">
                                <span class="blank"></span>
                                <div class="bookInfo">
                                    <p class="chapName">1화</p>
                                    <p class="chapInfo">
                                        <span class="fixButton">
                                            수정
                                        </span>
                                        <span class="chapText">
                                            글자수 5000
                                        </span>
                                        <span class="chapText">
                                            2017/10/10
                                        </span>
                                    </p>
                                </div>    
                             </li>
                             <li class="chap_line">
                                <span class="blank"></span>
                                <div class="bookInfo">
                                    <p class="chapName">2화</p>
                                    <p class="chapInfo">
                                        <span class="fixButton">
                                            수정
                                        </span>
                                        <span class="chapText">
                                            글자수 5000
                                        </span>
                                        <span class="chapText">
                                            2017/10/10
                                        </span>
                                    </p>
                                </div>    
                             </li>
                        </ul>

                    </div>     
                </div>
             </div>
             

          <!-- 컨텐츠 표시 영역 끝-->


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








</body>
</html>
