(window.onresize = function() {
    var win_height = $(window).height();
    var win_width = $(window).width();
    if (win_width <= 768) {
        $(".tailoring-content").css(
            {
                "top" : (win_height - $(".tailoring-content").outerHeight()) / 2,
                "left" : 0
            });
    } else {
        $(".tailoring-content").css(
            {
                "top" : "100px",
                "left" : "600px"
            });
    }
    if ($("#finalImg").attr("src")==""){
        $("#finalImg").css("display","none");
    }
})();

// 选择文件触发事件
function selectImg(file) {
    //文件为空，返回
    if (!file.files || !file.files[0]) {
        return;
    }
    $(".tailoring-container").toggle();
    var reader = new FileReader();
    reader.onload = function(evt) {
        var replaceSrc = evt.target.result;
        // 更换cropper的图片
        $('#tailoringImg').cropper('replace', replaceSrc, false);// 默认false，适应高度，不失真
    }
    reader.readAsDataURL(file.files[0]);
}
// cropper图片裁剪
$('#tailoringImg').cropper({
    aspectRatio : 1 / 1,// 默认比例
    preview : '.previewImg',// 预览视图
    guides : false, // 裁剪框的虚线(九宫格)
    autoCropArea : 0.5, // 0-1之间的数值，定义自动剪裁区域的大小，默认0.8
    movable : false, // 是否允许移动图片
    dragCrop : true, // 是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
    movable : true, // 是否允许移动剪裁框
    resizable : true, // 是否允许改变裁剪框的大小
    zoomable : false, // 是否允许缩放图片大小
    mouseWheelZoom : false, // 是否允许通过鼠标滚轮来缩放图片
    touchDragZoom : true, // 是否允许通过触摸移动来缩放图片
    rotatable : true, // 是否允许旋转图片
    crop : function(e) {
        // 输出结果数据裁剪图像。
    }
});
// 旋转
$(".cropper-rotate-btn").on("click", function() {
    $('#tailoringImg').cropper("rotate", 45);
});
// 复位
$(".cropper-reset-btn").on("click", function() {
    $('#tailoringImg').cropper("reset");
});
// 换向
var flagX = true;
$(".cropper-scaleX-btn").on("click", function() {
    if (flagX) {
        $('#tailoringImg').cropper("scaleX", -1);
        flagX = false;
    } else {
        $('#tailoringImg').cropper("scaleX", 1);
        flagX = true;
    }
    flagX != flagX;
});
var base64 = "";
// 确定按钮点击事件
$("#sureCut").on("click", function() {
    if ($("#tailoringImg").attr("src") == null) {
        return false;
    } else {
        var cas = $('#tailoringImg').cropper('getCroppedCanvas');// 获取被裁剪后的canvas
        base64 = cas.toDataURL('image/jpeg'); // 转换为base64
        $("#finalImg").css("display","inline");
        $("#finalImg").prop("src", base64);// 显示图片
        closeTailor();// 关闭裁剪框
    }
});


// 关闭裁剪框
function closeTailor() {
    $(".tailoring-container").toggle();
}

//ajax请求上传
function uploadFile(file) {
    $.ajax({
        url : '/user/changeUserImg',
        type : 'POST',
        data : "file=" + file,
        async : true,
        success : function(data) {
            console.log(data);
            alert("上传成功!");
            $("#user_headImg").attr("src", data.headImgPath);
            base64 = "";
            $("#finalImg").css("display","none");
        }
    });
}
//点击上传按钮开始上传文件
function upload() {
    if (!base64==""){
        if(confirm("您确定要上传头像吗？")){
            uploadFile(encodeURIComponent(base64));//编码后上传服务器
        }
    } else {
        alert("请选择文件！")
    }

}