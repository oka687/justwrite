<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html>
<head> 
    <title>WYSIWYG Editor</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <link rel="stylesheet" type="text/css" href="/resources/css/editor.css" />
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script  src="/resources/js/editor.js"></script>
    <script>
            function htmledit(excute,values){

            if(values == null){
                typing_area.document.execCommand(excute);
            }else{
                typing_area.document.execCommand(excute,"",values);
            }
        }    
    </script>
</head>
<body>
  <form name="form" style="height:100%;">
    <div class="tool_bar">
        <input type="text" style="width: 80%;" placeholder="검색어를 입력해주세요">
       <span id="close_button" style="cursor: pointer;" onclick="closeBar()">X</span>
    </div>
    <span id="open_sideBar" style="width: 5%; height: 5%; position: absolute; background-color: skyblue;cursor: pointer;" onclick="opener()">
     열기
    </span>

    <div class="editor_bg">
        <div class="button_area"  style="width: 100%; height: 5%;">
            <button type="button" onclick="htmledit('BOLD')">볼드</button>
			<button type="button" onclick="pageMove()">홈으로</button>
            <button type="button" onclick="datasubmit()">저장하기</button>
      
            <select id="fontSize" onchange="fontSizing()">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>
            
            <select id="chapNum" style="float: right;">
        
            
            	<c:forEach items="${chaptor}" var="chaptor"  varStatus="status">
                	<option value='${status.count}'><c:out value="${chaptor.chapName }" /></option>
				</c:forEach>
                <!-- 화가 아닌 이름으로 불러올 것 -->
            </select>
        </div>
      		<input type="text" id="n_title" placeholder="제목을 입력해주세요.">
	        <iframe name="typing_area" id="typing" style="width: 100%; height: 100%; border-width: 1px; border-color: #a8a0a0; left:10%;"
	        frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0>
	         	<textarea name="textform" style="display:none"></textarea>
	        </iframe>
     
    </div>
  



   </form>
   
   

   
   
</body>

<script type="text/javascript">
    
  $(document).ready(function(){

    typing_area.document.designMode = "On";
    findWide();
    closeBar();
    opener();
 

    

  });  
  
  
  typing_area.document.body.onkeydown = function (e){
	  if(e.which == 17) isCtrl=true;  
	  if(e.which == 83 && isCtrl == true){
		  datasubmit();
			e.preventDefault();
	  }
	  
  }
  
  
  document.onkeydown=function(e){  
	  
	  if(e.which == 17) isCtrl=true;  
	  if(e.which == 83 && isCtrl == true){
		  datasubmit();
			e.preventDefault();
	  }
	  
  }
  
  function pageMove(){
	  if(confirm("페이지를 이동하시면 작성 중인 내용을 잃게 됩니다. 이동하시겠습니까?")){
		  location.href = "http://localhost:8080/justwrites/firstPage";
		  return false;
	  }else{

		  return false;
	  }
	  
	  
  }
  
  
  
  
  function datasubmit(){
	  
	  
	  	var urlCatch = location.search;
	  	console.log(urlCatch);
	  	
	  	 var jbSplit = urlCatch.split('=');
	  	 
	  	 	console.log(jbSplit[1]);
	  
	  	  var noveltitle = $("#n_title").val();
	  	
	  	  var chapNo = document.getElementById('chapNum');
		  var chapcount = chapNo.childElementCount;
			
          var novelText = typing_area.document.body.innerHTML;
          
		  

          
		$.ajax({
				url:'/request/realWrite',
			 	type:"post",
			    dataType: "text",
			    contentType : "application/json; charset=utf-8",
			    type:'POST',
			    data:JSON.stringify(
			    		  {"chapName" : noveltitle,
			  		    	"content" : novelText,
			  		    	"bookName":jbSplit[1],
			  		    	"chapNo":chapcount
			    		  }
			    		),
			    success:function(result){
						alert("저장되었습니다.")
			    }
			    	
			    
			}); 
		
          
          
          
          
          
  }
  


</script>



</html>


