<%--
  Created by IntelliJ IDEA.
  User: 24186
  Date: 2021/5/29
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/doLogin" method="post">
        用户名：<input type="text" name="username" />
        密码：<input type="text" name="password" />${msg}
        <input type="submit" value="登录"> &nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/toRegister">注册</a>
    </form>
</body>
</html>
