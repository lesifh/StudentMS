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
    <div class="container">
        <form style="margin: 0 auto; width: 500px" method="post" action="${pageContext.request.contextPath}/updateStudent">
            <span class="label label-primary">姓名</span><input class="search"  type="text" name="name" value="${student.name}" /> <br/>
            <span class="label label-primary">年龄</span><input class="search"  type="text" name="age" value="${student.age}" /> <br/>
            <span class="label label-primary">性别</span><input class="search"  type="text" name="gender" value="${student.gender}" /> <br/>
            <span class="label label-primary">电话</span><input class="search"  type="text" name="number" value="${student.number}" /> <br/>
            <span class="label label-primary">地址</span><input class="search"  type="text" name="address" value="${student.address}" /> <br/>
            <span class="label label-primary">状态</span><input class="lastSearch search"  type="text" name="status" value="${student.status}" /> <br/>
            <input hidden type="text" name="id" value="${student.id}">
            <input class="btn-primary btn" type="submit">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input class="btn-primary btn" type="button" onclick="jump()" value="返回">
        </form>
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
