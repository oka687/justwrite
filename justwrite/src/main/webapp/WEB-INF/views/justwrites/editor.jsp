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
<!--             <button type="button" onclick="htmledit('italic')">이탤릭</button>
            <button type="button" onclick="htmledit('underline')">밑줄선</button> -->
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
                <option value="1">1화:프롤로그</option>
                <option value="2">2화:누구나 실수는 없는 법이다</option>
                <option value="3">3화:지랄</option>
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
  
  function datasubmit()
  {
	  	  var noveltitle = $("#n_title").val();
          var novelText = typing_area.document.body.innerHTML;
		  
          console.log(noveltitle);
          console.log(novelText);
          
          $.ajax{(
        		  
        		  url:'/request/novelWrite',
      		    url:'/request/realWrite',
    		    type:'POST',
    		    dataType:'text',
        		  contentType : "application/json; charset=utf-8",
				    data: formData,
				    type:'POST',
			
				    success:function(){};
				    	
          
          
          
          )}
          
          
          
          
          
          
  }
  


</script>



</html>


