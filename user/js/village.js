//地区和排序添加和删除active的class
$(function(){
    var liobj=$("#sortUl li");
    liobj.each(function(){
        $(this).click(function(){
        liobj.removeClass("active")
            $(this).addClass("active");
        });
    });
});


	var activityheight = 0;


 jQuery(document).ready(function($){
    //向下的箭头
 	$('#historyDown').click(function(){$('html,body').animate({scrollTop:$('#history').offset().top}, 800);});
	$('#cultureDown').click(function(){$('html,body').animate({scrollTop:$('#culture').offset().top}, 800);});
    $('#beautyDown').click(function(){$('html,body').animate({scrollTop:$('#beauty').offset().top}, 800);});
    $('#activityDown').click(function(){$('html,body').animate({scrollTop:$('#activityDiv').offset().top}, 800);});
 	$('#top').click(function(){$('html,body').animate({scrollTop:$('#ad-carousel').offset().top}, 800);});
    $('.entypo-map').click(function(){$('html,body').animate({scrollTop:$('#history').offset().top}, 800);});
    $('.entypo-record').click(function(){$('html,body').animate({scrollTop:$('#culture').offset().top}, 800);});
    $('.entypo-picture').click(function(){$('html,body').animate({scrollTop:$('#beauty').offset().top}, 800);});
    $('.entypo-flag').click(function(){$('html,body').animate({scrollTop:$('#activityDiv').offset().top}, 800);});
    
    
    $(".myPage li").click(function(){
    	if(!$(this).hasClass("choosen")){
    		$(this).addClass("choosen");
    		$(this).siblings().removeClass("choosen");
    		$(".myPage li a").css("color","#333");
    		$(this).find("a").css("color","white");
    	}
    });


    // 正在进行中的标签hover:
    $(".ImgClass").hover(function(){

        $(".blr").animate({
        top:0,
        bottom:0},50);
        $(".btb").animate({
        left:0,
        right:0},50)
    },function(){
        $(".blr").animate({
        top:"50%",
        bottom:"50%"},50);
    $(".btb").animate({
        left:"50%",
        right:"50%"},50)
    });

    
    height();


 });

function height(){
	activityheight = 0;
    var liobj=$(".countryWordClass");
    liobj.each(function(){
        activityheight += Number($(this).outerHeight(true));
    });
    activityheight += Number(600);
    // alert(activityheight);
    $("#activityImg").css("height",activityheight+"px");
}


/*左边导航条显示和消失*/
window.onscroll=function(){
    var scrollTop = document.documentElement.scrollTop||document.body.scrollTop;
    var top = $("#ad-carousel").outerHeight(true);
    if(scrollTop>= top - 100)
    {
        $("#left-nav").fadeIn();
        $("#left-nav").fadeIn("slow");
        $("#left-nav").fadeIn(3000);

    }    
    if(scrollTop>= 1200)
    {
        $("#top").fadeIn();
        $("#top").fadeIn("slow");
        $("#top").fadeIn(3000);

    } 
    if(scrollTop< top - 100)
    {
        $("#left-nav").fadeOut();
        $("#left-nav").fadeOut("slow");
        $("#left-nav").fadeOut(3000);
        $("#top").fadeOut();
        $("#top").fadeOut("slow");
        $("#top").fadeOut(3000);
    }

}

/*纸飞机事件*/

$(document).ready(function(){
    $("#plane").mouseover(function(){
            $('#plane').removeClass('float shadow').addClass('flyaway pushOut')
            .one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
             $('#plane').addClass('shadow float').removeClass('flyaway pushOut');})
    });
});
