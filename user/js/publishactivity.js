window.onload=init;

function init(){
    $(function(){   
        // 选中后样式改变(单选框)
        $('.choosebox li a').click(function(){
            var thisToggle = $(this).is('.size_radioToggle') ? $(this) : $(this).prev();
            var checkBox = thisToggle.prev();
            checkBox.trigger('click');
            $('.size_radioToggle').removeClass('current');
            thisToggle.addClass('current');
            return false;
        });
        // 选中后样式改变(复选框)
        $('.choosebox li a').click(function(){
            var thisToggle = $(this).is('.size_checkboxToggle') ? $(this) : $(this).prev();
            var checkBox = thisToggle.prev();
            checkBox.trigger('click');
            thisToggle.addClass('current');
            return false;
        });    
    });

    // 获取选择的值
    $(".choosebox li a").click(function(){
        var text = $(this).html();
        var classname=$(this).attr('class');
        if(classname=="size_radioToggle"){
            $(".choosetext span").html(text);
            // $("#result").html("" + getSelectedValue("dress-size"));
        }
        else if(classname=="size_checkboxToggle"){
            var textappend=$(".choosetext").append(text).html();
        }
    });
              
    // function getSelectedValue(id){
    //     return 
    //     $("#" + id).find(".choosetext span.value").html();
    // }
    
    // 删除行程
    $(".del-schedule").click(function(){
        var index = $("#activitydetails .del-schedule").index(this)+1;
        $("#activitydetails #activitydetail:nth-child("+index+")").remove();
        isdisabled();
    });

    $("#add-schedule").click(function(){
        $("#add-schedule").before($('#activitydetail').clone(true));
        var index = $(".activitydetail").length;
        $(this).prev().find('input').val("");
        $(this).prev().find('#activitynum1').attr("name","sday["+(index-1)+"]");
        $(this).prev().find('#activitynum2').attr("name","eday"+(index-1)+"]");
        $(this).prev().find('textarea').attr("name","content["+(index-1)+"]");
        $(this).prev().find('img').removeAttr('src');
        $(this).prev().find('#plus').css("display","block");
        isdisabled();
    });

    
    // 显示申请要求
    $(".next1").click(function(){
        $("#form2").css('display','block');
        $("#form1").css('display','none');
    });
    $(".previous2").click(function(){
        $('#form1').css('display','none');
        $('#form2').css('display','block');
        $('#form3').css('display','none');
    });
    // 显示活动基本信息
    $(".previous1").click(function(){
        $('#form1').css('display','block');
        $('#form2').css('display','none');
        $('#form3').css('display','none');
    });

    
    // 显示费用要求
    $(".next2").click(function(){
        $("#form3").css('display','block');
        $("#form2").css('display','none');
        $("#form1").css('display','none');
    });

    // 当安全事项与活动贴士、行程、申请须知的个数为1时，删除按钮禁用
    function isdisabled(){
        var tipsdel=$("#activitytips").children('input').length;
        if(tipsdel=="1"){
            $("#del2").attr('disabled','disabled');
        }
        else{
            $("#del2").removeAttr('disabled');
        }
        var safeitem=$("#safeitem").children('input').length;
        if(safeitem=="1"){
            $("#del1").attr('disabled','disabled');
        }
        else{
            $("#del1").removeAttr('disabled');
        }
        var applyitem=$("#applyitem").children('input').length;
        if(applyitem=="1"){
            $("#del3").attr('disabled','disabled');
        }
        else{
            $("#del3").removeAttr('disabled');
        }
        var delschedule=$(".del-schedule").length;
        if(delschedule=="1"){
            $(".del-schedule").attr('disabled','disabled');
        }
        else{
            $(".del-schedule").removeAttr('disabled');
        }
    }
    isdisabled();

    // 添加安全事项与活动贴士、申请须知的个数
    $('#add1').click(function(){
        $('#safeitem').append('<input type="text" class="form-control" placeholder="">');
        isdisabled();
    });
    $('#add2').click(function(){
        $('#activitytips').append('<input type="text" class="form-control" placeholder="">');
        isdisabled();
    });
    $('#add3').click(function(){
        $('#applyitem').append('<input type="text" class="form-control" placeholder="">');
        isdisabled();
    });

    // 删除安全事项与活动贴士、申请须知
    $('#del1').click(function(){
         $('#safeitem input:last-child').remove();
         isdisabled();
    });
    $('#del2').click(function(){
        $('#activitytips input:last-child').remove();
        isdisabled();
    });
    $('#del3').click(function(){
        $('#applyitem input:last-child').remove();
        isdisabled();
    });

    // 图片上传
    var filepath;
    $('.fileinput').change(function(){
        var index = $("#activitydetails .fileinput").index(this)+1;
        filepath=$(this).val(); 
        var filepath1=filepath.split('\\');
        var filename=filepath1[filepath1.length-1];
        $('#activitydetails #activitydetail:nth-child('+index+')').find('img').attr("src","../images/"+filename);
        $('#activitydetails #activitydetail:nth-child('+index+')').find('.plus').css('display','none');
    });

    // 活动简介的图片上传
    var introfilepath;
    $('.introfileinput').change(function(){
        introfilepath=$(this).val();
        var introfilepath1=introfilepath.split('\\');
        var introfilename=introfilepath1[introfilepath1.length-1];
        $('#introuploadpic').attr("src","../images/"+introfilename);
        $('#intromypic').css('top','3%');
        $('#intromypic').css('left','0');
        $('#intromypic').css('width','100%');
        $('#intromypic').css('border','1px solid #999999');
        $('#introeditText').css('display','none');

    });

    // 活动细则的图片上传
    var itemfilepath;
    $('.itemfileinput').change(function(){
        itemfilepath=$(this).val();
        var itemfilepath1=itemfilepath.split('\\');
        var itemfilename=itemfilepath1[itemfilepath1.length-1];
        $('#itemuploadpic').attr("src","../images/"+itemfilename);
        $('#itemmypic').css('top','3%');
        $('#itemmypic').css('left','0');
        $('#itemmypic').css('width','100%');
        $('#itemmypic').css('border','1px solid #999999');
        $('#itemeditText').css('display','none');

    });

   
}