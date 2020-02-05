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
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
            function htmledit(excute,values){

            if(values == null){
                typing_area.document.execCommand(excute);
            }else{
                typing_area.document.execCommand(excute,"",values);
            }
        }    
            function datasubmit()
            {
                    var b = typing_area.document.body.innerHTML;
                    console.log(b);
            }
    </script>
</head>
<body>
  <form name="form">
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
            <button type="button" onclick="htmledit('italic')">이탤릭</button>
            <button type="button" onclick="htmledit('underline')">밑줄선</button>
            <button type="button" onclick="datasubmit()">HTML보기</button>
       
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
            <select id="chapNum" style="position: absolute; left: 86%;">
                <option value="1">1화</option>
                <option value="2">2화</option>
                <option value="3">3화</option>
                <option value="4">4화</option>
                <option value="5">5화</option>
                <option value="6">6화</option>
                <option value="7">7화</option>
                <option value="8">8화</option>
                <option value="9">9화</option>
                <option value="10">10화</option>
            </select>
        </div>
      
	        <iframe name="typing_area" id="typing" style="width: 100%; height: 100%; border-width: 1px; border-color: #a8a0a0;"
	        frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0
	        >
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


  

  function findWide(){

    if(!$('.tool_bar').is(":visible")){
        widthWider();
    }


  }





 function fontSizing(){

    var target = document.getElementById('fontSize');

    var num = target.options[target.selectedIndex].value;

    htmledit('fontSize',num);    
   
 }   
 


function closeBar(){
  
    $('#close_button').click(function(){
        $('.tool_bar').hide();
        widthWider();
        $('#open_sideBar').show();
    });

    
} 

function widthWider(){

    if(!$('.tool_bar').is(":visible")){
     
        $('.editor_bg').css('width','80%');
        $('.editor_bg').css('margin','auto');
        $('.editor_bg').css('position','static');
        $('.editor_bg').css('display','block');
    }

}


function opener(){

    $('#open_sideBar').click(function(){
        $(this).hide();
        $('.tool_bar').show();
        reCss();
    });


}

function reCss(){
    $('.editor_bg').css('width','60%');
        $('.editor_bg').css('margin','auto');
        $('.editor_bg').css('position','absolute');
        $('.editor_bg').css('display','inline-block');
}



</script>
<style>

html{
    width: 100%;
    height: 100%;

}

body{
    margin: 0;
    padding: 0;
    width: 100%;
    height: 100%;


}
.editor_bg{
    width: 60%;
    height: 95%;
    position: absolute;
    display: inline-block;
    left: 21%;    
}

.tool_bar{
    width: 20%;
    height: 100%;
    background-color: #afadad;
    display: none;
    margin-right: 5px;
    position: absolute;
}

</style>


</html>


