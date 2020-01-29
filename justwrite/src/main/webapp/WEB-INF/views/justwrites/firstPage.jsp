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
                <div class="book_list">
                    <div class="book1">
                        <div class="book_img">
                            <img src='/resources/img/ex.jpg'>
                        </div>
                            <div class="title_area">
                                        <div class="title_line">
                            데댕라랑 댕라 [10]
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
                        <div class="chap"> 
                          <div class="chap_bar">
                            <div class="chap_name">소제목</div>
                            <div class="chap_no">회차</div>
                            <div class="chap_size">용량</div>
                            <div class="chap_letterNum">글자수</div>
                            <div class="chap_date">날짜</div>
                        </div>
                        <div class="chap_list">
                            <div class="chap_name">데댕라랑 댕라</div>
                            <div class="chap_no">1</div>
                            <div class="chap_size">10kb</div>
                            <div class="chap_letterNum">5000자</div>
                            <div class="chap_date">2017/01/11</div>
                        </div>
                        <div class="chap_list">
                            <div class="chap_name"></div>
                            <div class="chap_no">2</div>
                            <div class="chap_size">10kb</div>
                            <div class="chap_letterNum">5000자</div>
                            <div class="chap_date">2017/01/11</div>
                        </div>
                        <div class="chap_list">
                            <div class="chap_name"></div>
                            <div class="chap_no">3</div>
                            <div class="chap_size">10kb</div>
                            <div class="chap_letterNum">5000자</div>
                            <div class="chap_date">2017/01/11</div>
                        </div>
                        <div class="chap_list" style="border-top: #bbb9b9 solid 1px">
                            <div class="chap_name">댕라랑 함께</div>
                            <div class="chap_no">4</div>
                            <div class="chap_size">10kb</div>
                            <div class="chap_letterNum">5000자</div>
                            <div class="chap_date">2017/01/11</div>
                        </div>
                     
                        </div>






                    </div>
                </div>
             </div>
             

          <!-- 컨텐츠 표시 영역 끝-->

	<%@include file = "../includes/sidebar.jsp" %>      


</body>
</html>
