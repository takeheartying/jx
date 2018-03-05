// classification的hover
$("#classification").hover(function(){
	$("#paper-clip").css("color","#6699FF");
},function(){
	$("#paper-clip").css("color","#8EC5E4");
});

// 正在进行中的标签hover:
$(".myPicDiv").hover(function(){
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


// 选择的点击事件：
$("#classification ul li").click(function(){
	if(!$(this).hasClass("choosen")&&!$(this).hasClass("ulLabel")){
		$(this).addClass("choosen");
		$(this).siblings().removeClass("choosen");
	}

});

$("#moreAreasModal .btn,#moreActivitiesModal .btn").click(function(){
		$(this).closest(".modal-body").find(".btn").siblings().removeClass("choosen");
    $(this).addClass("choosen");
});	


// 分页：
$(".myPage li").click(function(){
	if(!$(this).hasClass("choosen")){
		$(this).addClass("choosen");
		$(this).siblings().removeClass("choosen");
		$(".myPage li a").css("color","#333");
		$(this).find("a").css("color","white");
	}
});
