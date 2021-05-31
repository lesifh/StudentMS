<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>登录</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
    <style>
        .form-signin {
            height: 500px;
        }
        .btn{
            width: 150px!important;
        }
    </style>
</head>
<body>
    <div class="container">
        <form class="form-signin" method="post" action="${pageContext.request.contextPath}/doLogin">
            <h2 class="form-signin-heading">请登录</h2>
            <label for="inputEmail" class="sr-only">用户名</label>
            <input type="text" name="username" id="inputEmail" class="form-control" placeholder="用户名" required autofocus>
            <br/>
            <label for="inputPassword" class="sr-only">密码</label>
            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>

            <div class="btn-group" role="group" aria-label="...">
            <button class="btn btn-primary " type="submit">登录</button>
            <button class="btn btn-primary " onclick="jump()">注册</button>
            </div>
            <br>
            <br>
            <br>
        </form>
    </div> <!-- /container -->
    <!-- NO.1 加载框架依赖的jQuery文件(压缩版)，版本是1.12.4 -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- NO.2 加载Bootstrap的所有JS插件，版本是3.3.7 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <script>
        var result = "${msg}";
        if (result == "密码错误"){
            swal ( "error" ,  "密码错误，请重新输入密码!" ,  "error" )
        } else if(result == "未注册"){
            swal ("error", "账号未注册", "error")
        } else if(result == "注册成功"){
            swal ("success", "注册成功！", "success")
        }
        function jump(){
            window.location.href="${pageContext.request.contextPath}/toRegister";
        }
    </script>
</body>
</html>
