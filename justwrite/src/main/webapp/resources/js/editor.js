
  

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
