<%--
  Created by IntelliJ IDEA.
  User: 24186
  Date: 2021/5/29
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
    <form method="post" action="${pageContext.request.contextPath}/doRegister">
        用户名：<input type="text" name="username" />
        密码：<input type="text" name="password" />
        <input type="submit" value="注册">
    </form>
</body>
</html>
