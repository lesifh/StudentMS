<%--
  Created by IntelliJ IDEA.
  User: 24186
  Date: 2021/5/29
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑学生</title>
</head>
<body>
    <form method="post" action="${pageContext.request.contextPath}/updateStudent">
        姓名<input type="text" name="name" value="${student.name}" /> <br/>
        年龄<input type="text" name="age" value="${student.age}" /> <br/>
        性别<input type="text" name="gender" value="${student.gender}" /> <br/>
        电话<input type="text" name="number" value="${student.number}" /> <br/>
        地址<input type="text" name="address" value="${student.address}" /> <br/>
        状态<input type="text" name="status" value="${student.status}" /> <br/>
        <input hidden type="text" name="id" value="${student.id}">
        <input type="submit">
    </form>
</body>
</html>
