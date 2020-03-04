<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html>
<head> 
    <title>JustWrite</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
        <!-- 헤더 부분 -->
<%@include file = "../includes/header.jsp" %>           
            <!-- 헤더 부분 끝-->
            
     <div class="bookCage">
        <div class="listBar">
            <div class="listBno" style="width: 10%;">번호</div>
            <div class="listTitle" style="width: 56%;">제목</div>
            <div class="chapCount"" style="width: 8%;">화수</div>
            <div class="writeDate" style="width: 14%;">작성일</div>
            <div class="listDelete" style="width: 8%;">삭제</div>
        </div>
        <c:forEach items="${bookList}" var="getList"  varStatus="status">
	        <ul class="bookList">
	                <li class="lno" style="width: 10%; text-align: center;">${status.count}</li>
	                <li class="bname" style="width: 56%;">${getList.bookName }</li>
	                <li class="chapCount" style="width: 8%; text-align: center;">${getList.count }</li>
	                <li class="regDate" style="width: 14%; text-align: center;">${getList.dateDate}</li>
	                <button class="dbutton" style="left: 3%;position: relative;" value="<c:out value='${getList.bookCode }' />" >삭제</button>
	        </ul>
        </c:forEach>
    </div>
   
</body>

<script type="text/javascript">
$(document).ready(function(){

	selectDelete();
	
	

})


function selectDelete(){
	
	$('.dbutton').click(function(){
		if(confirm("소설을 삭제하시면 절대로 복구할 수 없습니다. 정말로 삭제하시겠습니까?") == true){	
		var bcode = $(this).val();
	
		
		$.ajax({			  
			url:'/request/deleteChap',
		    type:'POST',
		    dataType:'text',
		    contentType : "application/text; charset=utf-8",
		    data: bcode, 
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
 

</script>
<style>
	html, body{
    padding : 0;
    margin : 0;
    width: 100%;
    height: 100%;
}
.bookCage{
    position: relative;
    top: 15%;
    }



.listBar{

    width: 70%;
    margin: auto;
    background-color: wheat;
    padding: 10px;
    font-size: 25px;
    font-weight: bold;
    top:5%;
    

}


.bookList{
    width: 70%;
    height: 10%;
    margin: auto;
    padding-top: 10px;
    padding-bottom: 10px;
    font-size: 20px;
}







/* 공통부분 */

    ul{

    list-style:none;
    padding-left:0px;
  
}

.listBar div{
    text-align: center;
    display : inline-block;
    
}

.bookList li{
    display: inline-block;
}

</style>


</html>


