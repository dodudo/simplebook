jigsaw.init({
    el: document.getElementById('container'),
    onSuccess: function () {
        $("#checkMsg").html("验证成功，即将登陆...")
        setTimeout('$("#login_form").submit()',500);
    },
    onFail: function () {
        $("#checkMsg").html("验证失败，再试一次！")
    },
    onRefresh: function () {
        $("#checkMsg").html("")
    }
});
function login() {
    var flag = true;
    if (!checkUserInput()) flag = false;
    if (!checkPwd()) flag = false;
    if (flag){
        console.log("dafg")
        $("#login_btn").attr("data-toggle","modal");
        $("#login_btn").attr("data-target",".bs-example-modal-sm");
    } else {
        $("#login_btn").removeAttr("data-toggle");
        $("#login_btn").removeAttr("data-target");

    }
}
//验证账号是否填写
function checkUserInput() {
    var input = $("#uname").val().trim();
    var userId=$(".uname-warm");
    if (input==""){
        userId.html("账号不能为空！");
        return false;
    }
    userId.html("");
    return true;
}