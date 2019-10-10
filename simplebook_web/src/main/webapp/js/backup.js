$("#signin_btn").click(function () {
    var flag = true;
    if (!checkEmail()) flag = false;
    if (!checkPwd()) flag = false;
    if (!checkRepwd()) flag = false;
    if (!emailCheck()) flag = false;
    if (flag) {
        $.ajax({
            url: "/checkEmailCode",
            type: "get",
            data: {"emailCode": $("#email-check").val()},
            success: function (data) {
                if (data.errMsg) {
                    $.ajax({
                        url: "user/backupPwd",
                        type: "post",
                        data: $("#signup_form").serialize(),
                        success: function (data) {
                            if (data.change_msg) {
                                if (confirm("修改成功，您要登录吗？")) {
                                    window.location.href = "login";
                                } else {

                                }
                            } else {
                                alert("修改失败！")
                            }
                        }
                    });
                } else {
                    alert("验证码错误")
                }

            },
            error: function () {

            }
        })

    } else {

    }
});

function emailCheck() {
    var value = $("#email-check").val();
    if (value == "") {
        $(".email-check-warm").html("验证码不能为空");
        return false;
    } else if (value.length > 4) {
        $(".email-check-warm").html("验证码不能超过四位");
        value = value.slice(0, 4);
        return false;
    } else {
        $(".email-check-warm").html("");
        return true;
    }


}

function checkEmailCode() {
    var checkBtn = $(".check-code");
    checkBtn.attr("disabled", "disabled");
    checkBtn.attr("onclick", "false");
    if (checkEmail() && checkUser()) {
        $.ajax({
            url: "/sendEmailCode",
            type: "get",
            data: {'emailUrl': $("#email").val().trim(), 'username': $("#email").val()},
            error: function () {
            },
            success: function () {
                setTime();
            }
        })
    }

}

function setTime() {
    var checkBtn = $(".check-code");
    checkBtn.html("60s");
    checkBtn.attr("disabled", "disabled");
    checkBtn.attr("onclick", "false");
    var flag = false;
    var time = setInterval(function () {
        if (parseInt(checkBtn.html()) == 0) {
            clearInterval(time);
            checkBtn.removeAttr("disabled");
            checkBtn.attr("onclick", "checkEmailCode()");
            checkBtn.html("获取验证码");
            flag = true;
        } else {
            checkBtn.html(parseFloat(checkBtn.html()) - 1 + 's');
            flag = false;
        }
    }, 1000);
    return flag;
}