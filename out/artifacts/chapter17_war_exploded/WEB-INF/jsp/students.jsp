<%--
  Created by IntelliJ IDEA.
  User: 24186
  Date: 2021/5/27
  Time: 0:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>学生信息</title>
    <style>
        td{
            text-align: center;
        }
    </style>
</head>
<body>
    当前用户：${USER_SESSION.username} <a href="${pageContext.request.contextPath}/doLogout">退出</a>
    <br/>
    <button><a href="${pageContext.request.contextPath}/toAdd">增加学生</a></button>
    <c:if test="${searchCondition != null and searchCondition != ''}">
        <form method="post" action="${pageContext.request.contextPath}/findStudent">
            ID：<input type="text" name="id" value="${searchCondition.id}"> &nbsp;&nbsp;&nbsp;&nbsp;
            姓名：<input type="text" name="name" value="${searchCondition.name}">&nbsp;&nbsp;&nbsp;&nbsp;
            地址：<input type="text" name="address" value="${searchCondition.address}">&nbsp;&nbsp;&nbsp;
            <input type="submit" value="搜索" />
            <input type="reset" value="重置">
        </form>
    </c:if>
    <c:if test="${searchCondition == null or searchCondition == ''}">
        <form method="post" action="${pageContext.request.contextPath}/findStudentByConditions">
            ID：<input type="text" name="id" > &nbsp;&nbsp;&nbsp;&nbsp;
            姓名：<input type="text" name="name" >&nbsp;&nbsp;&nbsp;&nbsp;
            地址：<input type="text" name="address" >&nbsp;&nbsp;&nbsp;
            <input type="submit" value="搜索" />
            <input type="reset" value="重置" />
        </form>
    </c:if>


    <table border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td>姓名</td>
            <td>年龄</td>
            <td>性别</td>
            <td>电话</td>
            <td>地址</td>
            <td>状态</td>
            <td>Id</td>
            <td colspan="2">操作</td>
        </tr>
        <c:if test="${student != null and student != ''}">
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.gender}</td>
            <td>${student.number}</td>
            <td>${student.address}</td>
            <td>${student.status}</td>
            <td>${student.id}</td>
            <td colspan="2"><a href="${pageContext.request.contextPath}/deleteStudent?id=${student.id}">删除</a>
                &nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toEdit?id=${student.id}">修改</a>
            </td>
        </c:if>
        <c:if test="${students != null and students != ''}">
            <c:forEach items="${students}" var="student" >
                <tr>
                    <td>${student.name}</td>
                    <td>${student.age}</td>
                    <td>${student.gender}</td>
                    <td>${student.number}</td>
                    <td>${student.address}</td>
                    <td>${student.status}</td>
                    <td>${student.id}</td>
                    <td colspan="2"><a href="${pageContext.request.contextPath}/deleteStudent?id=${student.id}">删除</a>
                        &nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toEdit?id=${student.id}">修改</a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <td colspan="8"><c:if test="${noStudents != null}">
            ${noStudents}
        </c:if></td>
    </table>

</body>
</html>
