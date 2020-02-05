<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 사이드바 부분 -->
        <div class="menu">
            <div class="user_box">
                <span>안녕하세요. <c:out value="${userNick}" /> 님</span>
            </div>
            <div class="book_status">      
                    작성 중인 글 : 1
            </div>

            <div class="menu_adder">
                <div class="img_box" id="add_book">
                        <img src="/resources/img/plus.png" alt="plus">     추가
    
                    </div>
            <div class="menu_bar">      
                데댕라랑 댕라
            </div>
            <ul>
                <li class="side_menu">설정</li>
                <li class="side_menu">아웃라인</li>
                <li class="side_menu">본문</li>
            </ul>    

            <div class="menu_bar">      
                치료사입니다. 1인 치료가 전문입니다.
            </div>
            <ul>
                <li class="side_menu">설정</li>
                <li class="side_menu">아웃라인</li>
                <li class="side_menu">본문</li>
            </ul>   
            <div class="menu_bar">      
                이것이 내 힘이다
            </div>
            <ul>
                <li class="side_menu">설정</li>
                <li class="side_menu">아웃라인</li>
                <li class="side_menu">본문</li>
            </ul>   
        </div>
        
        <!-- 설정을 눌렀을 때 -->
    </div>
    <div class="menu1">
        <div class="user_box">
            <span>블러디테일 설정란</span>
           <a href="#"><span class="arrow"><img src="/resources/img/arrow.png"></span></a> 
        </div>
        <div class="book_status">      
            30화까지 작성했습니다.
        </div>

        <div class="menu_adder">
        <div class="menu_bar">      
            등장인물
        </div>
        <ul>
            <div class="img_box" style="font-size: 15px;">
                <img src="/resources/img/plus.png" alt="plus">     추가
            </div>
            <li class="side_menu">루이</li>
            <li class="side_menu">로이</li>
            <li class="side_menu">레이</li>
        </ul>    

        <div class="menu_bar">      
           지명
        </div>
        <ul>
            <li class="side_menu">로렌성</li>
            <li class="side_menu">로렌숲</li>
            <li class="side_menu">레인숲</li>
        </ul>   
    </div>
</div>
    <!-- 추가페이지 -->

    <div class="add_bg">
      
        <div class="add_main">
            <div class="b_title">
               새로 만들 소설의 제목을 입력해주세요.
                <span class="close_button" style="position: fixed; left: 84%; font-weight: bold; cursor: pointer;">X</span><br>
                    <input type="text" style="width: 40%; padding: 2px; margin: 13px;">
            </div>
            <div class="b_genre">
                <p>장르를 선택해주세요.</p>
                <select id="select_genre" style="width: 30%;">
                    <option value="판타지">판타지</option>
                    <option value="게임판타지">게임판타지</option>
                    <option value="현대판타지">현대판타지</option>
                    <option value="무협">무협</option>
                    <option value="라이트노벨">라이트노벨</option>
                </select>
            </div>
            <div class="b_genre">
                <p>사용할 기능을 선택해주세요.</p>
                <label for="content"><span>본문</span></label>
                   <input type="checkbox" id="content">
                <label for="people"><span>등장인물</span></label>
                   <input type="checkbox" id="people">
                <label for="outline"><span>아웃라인</span></label>
                <input type="checkbox" id="outline">
            </div>
                <button type="submit" style="margin-top: 2%;">확인</button>
        </div>

    </div>
     <!-- 추가페이지 끝-->

<!-- 사이드바 부분 끝-->

</body>
</html>