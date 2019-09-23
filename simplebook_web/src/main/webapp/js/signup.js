$("#signin_btn").click(function () {
    var flag = true;
    if (!checkUser()) flag = false;
    if (!checkEmail()) flag = false;
    if (!checkPwd()) flag = false;
    if (!checkRepwd()) flag = false;
    if (!emailCheck()) flag = false;
    if (!checkHadUser()) flag = false;
    if (!checkHadEmail()) flag = false;
    if (flag){
        $.ajax({
            url:"/checkEmailCode",
            type:"get",
            data:{"emailCode":$("#email-check").val().trim()},
            success:function (data) {
                if (data.errMsg){
                    $("#signup_form").submit();
                } else {
                    alert("验证码错误")
                }

            },
            error:function () {

            }
        })

    }else {

    }
});
function emailCheck() {
    var value = $("#email-check").val().trim();
    if (value==""){
        $(".email-check-warm").html("验证码不能为空");
        return false;
    } else if (value.length>4){
        $(".email-check-warm").html("验证码不能超过四位");
        value=value.slice(0,4);
        return false;
    } else {
        $(".email-check-warm").html("");
        return true;
    }


}
function checkEmailCode() {
    var checkBtn=$(".check-code");
    checkBtn.attr("disabled","disabled");
    checkBtn.attr("onclick","false");
    if (checkEmail()&&checkUser()) {
        $.ajax({
            url:"/sendEmailCode",
            type:"get",
            data:{'emailUrl':$("#email").val().trim(),'username':$("#uname").val().trim()},
            error:function () {
            },
            success:function () {
                setTime();
            }
        })
    }

}
function setTime() {
    var checkBtn=$(".check-code");
    checkBtn.html("60s");
    checkBtn.attr("disabled","disabled");
    checkBtn.attr("onclick","false");
    var flag = false;
    var time = setInterval(function () {
        if (parseInt(checkBtn.html()) == 0){
            clearInterval(time);
            checkBtn.removeAttr("disabled");
            checkBtn.attr("onclick","checkEmailCode()");
            checkBtn.html("获取验证码");
            flag = true;
        }else {
            checkBtn.html(parseFloat(checkBtn.html())-1+'s');
            flag = false;
        }
    },1000);
    return flag;
}
function checkHadUser() {
    var flag = false;
    $.ajax({
        url:"/user/checkUser",
        type:"get",
        async:false,
        data:{"uname":$("#uname").val().trim()},
        success:function (data) {
            if (data.noUser){
                flag = true;
            } else {
                $(".uname-warm").html("用户名已存在");
                flag = false;
            }
        },
        error:function () {

        }
    });
    return flag;
}
function checkHadEmail() {
    var flag = false;
    $.ajax({
        url:"/user/checkEmail",
        type:"get",
        async:false,
        data:{"email":$("#email").val().trim()},
        success:function (data) {
            if (data.noEmail){
                flag = true;
            } else {
                $(".email-warm").html("此邮箱已经注册过啦，请更换一个！");
                flag = false;
            }
        },
        error:function () {

        }
    });
    return flag;
}
