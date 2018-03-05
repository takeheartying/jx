window.onload=init;

function init(){

	// 我的游记

    
    $('#publishnote').click(function(){
    	window.location.href="publishnotes.jsp"
    });

    $('#travelnotes').click(function(){
    	$('.col-md-4').css({'color':'black','border-bottom':'none'});
    	$('.content').css('display','none');
    	$('#travelnotes').css({'color':'#78CFED','border-bottom':'5px solid #78CFED'});
    	$('.travelnotes').css('display','block');
    	$('#h2btn .btn').css('display','none');
    	$('#h2btn h2').css('display','none');
    	$('#publishtitle2').css('display','block');
    	$('#publishnote').css('display','block');
    	$('#publishactivity').css('display','none');
    });;

    // 我的活动
    $('.delrecord').click(function(){
        $(this).parent().parent().remove();
    });
    
    $('#publishactivity').click(function(){
    	window.location.href="publishactivity.jsp"
    	
    });

    $('#activityabstract').click(function(){
    	$('.col-md-4').css({'color':'black','border-bottom':'none'});
    	$('.content').css('display','none');
    	$('#activityabstract').css({'color':'#78CFED','border-bottom':'5px solid #78CFED'});
    	$('.activityabstract').css('display','block');
    	$('#h2btn .btn').css('display','none');
    	$('#h2btn h2').css('display','none');
    	$('#publishtitle1').css('display','block');
    	$('#publishactivity').css('display','block');

    });

    // 账户设置
    // 头像上传
    var filepath;
    $('.fileinput').change(function(){
        filepath=$(this).val(); 
        var filepath1=filepath.split('\\');
        var filename=filepath1[filepath1.length-1];
        $('#uploadpic').attr("src","../images/"+filename);
        $('#mypic').css('width','100%');
        $('#mypic').css('border','1px solid white');
        $('#editAvatar').css('background','none');
    });

    // 单选框
    function changeState(el) {
        if (el.readOnly) el.checked=el.readOnly=false;
        else if (!el.checked) el.readOnly=el.indeterminate=true;
    }
    $('#setaccount').click(function(){
    	$('.col-md-4').css({'color':'black','border-bottom':'none'});
    	$('.content').css('display','none');
    	$('#setaccount').css({'color':'#78CFED','border-bottom':'5px solid #78CFED'});
    	$('.setaccount').css('display','block');
    	$('#h2btn button').css('display','none');
    	$('#h2btn h2').css('display','none');
    	$('#publishactivity').css('display','none');
    });

}