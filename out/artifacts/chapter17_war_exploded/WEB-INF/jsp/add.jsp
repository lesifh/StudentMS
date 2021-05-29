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
</head>
<body>
    <form method="post" action="${pageContext.request.contextPath}/addStudent">
        姓名<input type="text" name="name" /> <br/>
        年龄<input type="text" name="age"  /> <br/>
        性别<input type="text" name="gender"  /> <br/>
        电话<input type="text" name="number"  /> <br/>
        地址<input type="text" name="address"  /> <br/>
        状态<input type="text" name="status"  /> <br/>
        <input type="submit">
    </form>
</body>
</html>
