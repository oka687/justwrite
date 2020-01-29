$(document).ready(function(){
    menuMove();
    sideMover();
    arrowMover();
    addBook();
    Xbutton();
   

})

function includeHtml() {
 $("include-html").each(function() {
  element = $(this);
  element.load(element.attr("target"), eval(element.attr("completed")));
 });
}

 



function menuMove(){

    $('.menu_bar').click(function(){
     
        $(this).next().slideUp();

        if(!$(this).next().is(":visible")){
            $(this).next().slideDown();
        }


    });

}
    
function sideMover(){

$('.side_menu').click(function(){
    $('.menu1').css('display','inline-block');

});


}

function arrowMover(){

    $('.arrow').click(function(){
     
        if($('.menu1').is(":visible")){
            $('.menu1').css('display','none')
        }

    });


}

function addBook(){

   
    $('#add_book').click(function(){
       
        $('.add_bg').show();

    });

}


function Xbutton(){

    $('.close_button').click(function(){
        $('.add_bg').hide();


    });

}

