<%--
  Created by IntelliJ IDEA.
  User: Administream
  Date: 2019/9/11
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>文章编辑页面</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/bootstrap.min.css">

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/release/wangEditor-fullscreen-plugin.css">

      <!-- 编辑器编辑后，提交时执行js，获得编辑器的内容，赋值给textarea，用于向后台提交存入数据库 -->
     
    <script type="text/javascript">
        function modifyContent() {
            var introduce = document.getElementById("introduce");
            introduce.value = editor.txt.html();
        }

        //点击提交按钮触发下面的函数
        function submitit() {
            //第一个表单
            var tfhead = document.getElementById("ofhead");
            //第二个表单
            var tfbody = document.getElementById("ofbody");
            //提交第一个表单
            tfhead.submit();
            //提交第二个表单
            tfbody.submit();

            window.location.href = "${pageContext.request.contextPath}/editor-sccuss";
        }
    </script>

</head>
<body>
<form name="fhead" id="ofhead" target="_hiddenframe1" action="${pageContext.request.contextPath}/article/addArticle"
      method="post" role="form">
    <div class="form-group">
        <input name="uid" value="${sessionScope.user.uid}" style="display: none"/>
        <input name="headurl" value="post-5.jpg" style="display: none"/>
        <input type="text" name="head" class="form-control" placeholder="标题"/>
        <input name="articleId" value="BKAAA" style="display: none"/>
        <br>
        <input name="describe" class="form-control" placeholder="简短的描述"/>
        <input name="articleState" value="1" style="display:none;"/>
    </div>
</form>
<form name="fbody" id="ofbody" target="_hiddenframe2"
      action="${pageContext.request.contextPath}/article/addArticleContent" method="post">
    <%--<form name="fbody" id="ofbody" target="_hiddenframe2" action="${pageContext.request.contextPath}/article/addArticleContent" method="post" onsubmit="modifyContent()">--%>
    <div>
        <input name="articleId" value="BKAAA" style="display: none">
        <%-- <textarea rows="5" cols="35" name="articleContent" style="display:none;" id="introduce"></textarea>--%>

        <input type="hidden" name="articleContent" id="editor_txt">

        <div id="div1">
            <p>欢迎使用 wangEditor 富文本编辑器</p>
        </div>

        <input type="submit" class="btn btn-default" id="btn1" style="margin-left: 600px;" onClick="submitit()"/>


        <script src="${pageContext.request.contextPath}/release/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/release/wangEditor.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/release/wangEditor-fullscreen-plugin.js"></script>
        <script type="text/javascript">
            var E = window.wangEditor;
            var editor = new E('#div1');

            editor.customConfig.uploadImgShowBase64 = true; // 使用 base64 保存图片

            // // 配置服务器端地址
            // editor.customConfig.uploadImgServer = 'uploadImg';
            // editor.customConfig.uploadFileName = 'myFileName';
            // /* editor.customConfig.debug = location.href.indexOf('wangeditor_debug_mode=1') > 0 */
            //
            // // 进行下文提到的其他配置
            //
            // editor.customConfig.uploadImgTimeout = 30000;  //默认10秒
            //
            // editor.customConfig.uploadImgHooks = {
            //     before: function (xhr, editor, files) {
            //         // 图片上传之前触发
            //         // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件
            //
            //         // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            //         // return {
            //         //     prevent: true,
            //         //     msg: '放弃上传'
            //         // }
            //     },
            //     success: function (xhr, editor, result) {
            //         // 图片上传并返回结果，图片插入成功之后触发
            //         // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            //
            //         /* alert("success:" + result); */
            //         /*  alert(eval('(' + result + ')')); */
            //     },
            //     fail: function (xhr, editor, result) {
            //         // 图片上传并返回结果，但图片插入错误时触发
            //         // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            //         alert("fail：" + result);
            //     },
            //     error: function (xhr, editor) {
            //         // 图片上传出错时触发
            //         // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            //     },
            //     timeout: function (xhr, editor) {
            //         // 图片上传超时时触发
            //         // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            //     },
            //
            //     // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
            //     // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
            //     customInsert: function (insertImg, result, editor) {
            //         // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            //         // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
            //
            //         // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            //         var url = result.url;
            //         alert("customInsert:" + url);
            //         insertImg(url)
            //
            //         // result 必须是一个 JSON 格式字符串！！！否则报错
            //
            //     }
            // };

            editor.create();
            document.getElementById('btn1').addEventListener('click', function () {
                // 读取 html
                var editor_txt = editor.txt.html();
                document.getElementById('editor_txt').value = editor_txt;
            }, false);

            //初始化全屏插件
            E.fullscreen.init('#div1');

        </script>
    </div>
</form>

<!-- 加入了style="display:none;"用于隐藏 -->
<iframe name="_hiddenframe1" style="display:none;"></iframe>

<iframe name="_hiddenframe2" style="display: none"></iframe>
</body>
</html>
