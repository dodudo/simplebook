
/*用户名验证*/
function checkUser(){
    var user=$("#uname").val();
    var userId=$(".uname-warm");
    userId.html("");
    var reg=/^[a-zA-Z\u4E00-\u9FA5][a-zA-Z0-9\u4E00-\u9FA5]{2,10}$/;
    if(reg.test(user)==false){
        userId.html("用户名由字母，中文及数字组成，长度在3-10之间");
        return false;
    }
    return true;
}
/*密码验证*/
function checkPwd(){
    var pwd=$("#password").val();
    var pwdId=$(".password-warm");
    pwdId.html("");
    var reg=/^[a-zA-Z0-9]{4,10}$/;
    if(reg.test(pwd)==false){
        pwdId.html("密码不能含有非法字符，长度在4-10之间");
        return false;
    }
    return true;
}

function checkRepwd(){
    var repwd=$("#repassword").val();
    var pwd=$("#password").val();
    var repwdId=$(".repassword-warm");
    repwdId.html("");
    if(pwd!=repwd){
        repwdId.html("两次输入的密码不一致");
        return false;
    }
    return true;
}

/*验证邮箱*/
function checkEmail(){
    var email=$("#email").val();
    var email_prompt=$(".email-warm");
    email_prompt.html("");
    var reg=/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
    if(reg.test(email)==false){
        email_prompt.html("Email格式不正确，例如web@sohu.com");
        return false;
    }
    return true;
}


/*验证手机号码*/
function checkMobile(){
    var mobile=$("#phone").val();
    var mobileId=$(".phone-warm");

    var regMobile=/^1\d{10}$/;
    if(regMobile.test(mobile)==false){
        mobileId.html("手机号码不正确，请重新输入");
        return false;
    }
    mobileId.html("");
    return true;
}

