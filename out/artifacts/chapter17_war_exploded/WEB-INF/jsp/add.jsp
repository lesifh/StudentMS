<%--
  Created by IntelliJ IDEA.
  User: 24186
  Date: 2021/5/29
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加学生</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/signin.css" rel="stylesheet">
    <style>
        .search {
            border-radius: 10%;
            margin-right: 50px;
            margin-left: 4px;
            border: 1px;
            height: 27px;
            margin-bottom: 5px;
        }
        .label-primary {
            font-size: 15px;
        }
        .lastSearch {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%--<div class="container">--%>
<%--    <form class="form-signin" method="post" action="${pageContext.request.contextPath}/doLogin">--%>
<%--        <h2 class="form-signin-heading">请登录</h2>--%>
<%--        <label for="inputEmail" class="sr-only">用户名</label>--%>
<%--        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="用户名" required autofocus>--%>
<%--        <br/>--%>
<%--        <label for="inputPassword" class="sr-only">密码</label>--%>
<%--        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required>--%>
<%--        <div class="btn-group" role="group" aria-label="...">--%>
<%--            <button class="btn btn-primary " type="submit">登录</button>--%>
<%--            <button class="btn btn-primary " onclick="jump()">返回</button>--%>
<%--        </div>--%>
<%--        <br>--%>
<%--        <br>--%>
<%--        <br>--%>
<%--    </form>--%>
<%--</div> <!-- /container -->--%>
<div class="container">
    <div class="container">
        <form style="margin: 0 auto; width: 500px" method="post" action="${pageContext.request.contextPath}/updateStudent">
            <span class="label label-primary">姓名</span><input class="search"  type="text" name="name"  /> <br/>
            <span class="label label-primary">年龄</span><input class="search"  type="text" name="age"  /> <br/>
            <span class="label label-primary">性别</span><input class="search"  type="text" name="gender" /> <br/>
            <span class="label label-primary">电话</span><input class="search"  type="text" name="number" /> <br/>
            <span class="label label-primary">地址</span><input class="search"  type="text" name="address" /> <br/>
            <span class="label label-primary">状态</span><input class="lastSearch search"  type="text" name="status" /> <br/>&nbsp;
            <input class="btn btn-primary" type="submit">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input class="btn-primary btn" type="button" onclick="jump()" value="返回">
        </form>
    </div>

</div>
    <!-- NO.1 加载框架依赖的jQuery文件(压缩版)，版本是1.12.4 -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- NO.2 加载Bootstrap的所有JS插件，版本是3.3.7 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script>
        function jump(){
            window.location.href="${pageContext.request.contextPath}/findAllStudents";
        }
    </script>
</body>
</html>
