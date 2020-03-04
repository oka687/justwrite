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
                            <img src='<c:out value="${bookinfo.bookCover }" />'>
                        </div>
                            <div class="title_area">
                                        <div class="title_line">
                           <c:out value="${bookinfo.bookName }" /> [<span id="chapCount"><c:out value="${counter}" /></span>]
                            <span class="updateDate" style="float: right;">
                                <c:out value="${bookinfo.dateDate }" />
                            </span>
                            </div>
                            <div class="book_line">
                                <c:out value='${bookinfo.bookEx.replaceAll("\\\<.*?\\\>","")}' />
                            </div>
                         </div>
     
                    </div>

		
		<c:choose>
		
			<c:when test="${chap ne 'null'}">
                    <div class="chapList" id="forCount">
				<c:forEach items="${chap}" var="chapthis">
                        <ul class="chapBox">
                            <li class="chap_line">
                                <span class="blank"></span>
                                <div class="bookInfo">
                                    <p class="chapName"><c:out value="${chapthis.chapName }" />
                                    
                                    <button class="deleteChap" value="<c:out value='${chapthis.chapName }' />">삭제</button>
                                    </p>
                                    	
                                    
                                    <p class="chapInfo">
                                        <span class="fixButton">
                                            <a href="http://localhost:8080/justwrites/updateEd?bookName=${bookinfo.bookName }&chapName=${chapthis.chapName}">수정</a>
                                        </span>
                                        <span class="chapText">
                                            글자수 <c:out value="${chapthis.textCount }" />
                                        </span>
                                        <span class="chapText">
                                            <c:out value="${chapthis.updateDate }" />
                                        </span>
                                    </p>
                                </div>    
                             </li>
	                    </ul>
	                </c:forEach>    
	                  </div> 
                  </c:when>
                    <c:when test="${chap eq 'null'}">
                    		<div class="chapList">
                        <ul class="chapBox">
                            <li class="chap_line_not">
                                <span class="blank_not"></span>
                                <div class="bookInfo">
        							<div class="notBox">
        								<a href="http://localhost:8080/justwrites/check?bookName=<c:out value='${bookinfo.bookName }' />">
        									<h3 style="position: relative;left: 37%;margin-top: 15px;">작성</h3>
        								</a>
        							</div>
                                </div>    
                             </li>
	                    </ul>
	                  </div> 
                    </c:when>
         </c:choose> 
                </div>
             </div>
             

          <!-- 컨텐츠 표시 영역 끝-->


</body>
<script>
$(document).ready(function(){
    info();
    infoHide();
   
    deleteChap();
})





function deleteChap(){
		$(".deleteChap").click(function(){
			
		if(confirm("삭제하시면 복구할 수 없습니다. 정말로 삭제하시겠습니까?") == true){	
			var chapName = $(this).val();
			var bookName =  '<c:out value="${bookinfo.bookName }" />';
			
		
			
			$.ajax({			  
				url:'/request/deleteNovel',
			    type:'POST',
			    dataType:'text',
			    contentType : "application/json; charset=utf-8",
			    data:JSON.stringify(
			    		  {"bookName" : bookName}
			    		), 
					    success: function(data) {
					    	
					    	if(data == "success"){
					    		alert("삭제 성공");
					    		window.location.reload();
					    	}
					    }
			    })
			
		}else{
			return false;
		}
		})
		
	
}



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