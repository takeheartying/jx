

//地区和排序添加和删除active的class
$(function(){
    var liobj=$("#areaUl li");
    liobj.each(function(){
        $(this).click(function(){
        liobj.removeClass("active")
            $(this).addClass("active");
        });
    });
});

$(function(){
    var liobj=$("#sortUl li");
    liobj.each(function(){
        $(this).click(function(){
        liobj.removeClass("active")
            $(this).addClass("active");
        });
    });
});


//向下的箭头
 jQuery(document).ready(function($){
    $('#firstDown').click(function(){$('html,body').animate({scrollTop:$('#firstDown').offset().top}, 800);});
    $('#secondDown').click(function(){$('html,body').animate({scrollTop:$('#secondDown').offset().top}, 800);});
    $('#top').click(function(){$('html,body').animate({scrollTop:$('#bigImgDiv').offset().top}, 800);});
 });




/*纸飞机事件*/

$(document).ready(function(){
    $("#plane").mouseover(function(){
            $('#plane').removeClass('float shadow').addClass('flyaway pushOut')
            .one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
             $('#plane').addClass('shadow float').removeClass('flyaway pushOut');})
    });
});

