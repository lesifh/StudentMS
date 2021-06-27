<%--
  Created by IntelliJ IDEA.
  User: 24186
  Date: 2021/5/27
  Time: 0:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>学生信息管理系统</title>
    <%--    bootstrap--%>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .jumbotron {
            height: 210px !important;
        }

        td {
            text-align: center;
        }

        th {
            text-align: center;
        }

        .search {
            border-radius: 10%;
            margin-right: 50px;
            margin-left: 4px;
            border: 1px;
            height: 27px;
        }

        .label-primary {
            font-size: 15px;
        }

        #last-search {
            margin-right: 50px;
        }

        #last-search1 {
            margin-right: 50px;
        }

        .jumbotron h1 {
            margin-left: 20px;
        }
    </style>
</head>
<body>
<div class="jumbotron">
    <h1>Hello, ${USER_SESSION.username}
    </h1>
    <c:if test="${searchCondition != null and searchCondition != ''}">
        <form id="sf" method="post" action="${pageContext.request.contextPath}/findStudent">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <span class="label label-primary">ID</span><input class="search" type="text" name="id"
                                                              value="${searchCondition.id}"> &nbsp;&nbsp;&nbsp;&nbsp;
            <span class="label label-primary">姓名</span><input class="search" type="text" name="name"
                                                              value="${searchCondition.name}">&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="label label-primary">地址</span>
            <input id="last-search1" class="search" type="text" name="address" value="${searchCondition.address}">&nbsp;&nbsp;&nbsp;
            <input class="btn-primary btn" type="submit" value="搜索"/>
            &nbsp;&nbsp;
            <input class="btn btn-primary" type="reset" value="重置">
            &nbsp;&nbsp;
            <button onclick="addStudent()" class="btn btn-primary">增加学生</button>
            &nbsp;&nbsp;
            <button onclick="logout()" class="btn btn-primary">退出</button>
            <%--            分页查询隐藏对象--%>
            <input type="hidden" name="pageNum" class="pageNum" value="${students.pageNum}">
            <input type="hidden" name="pageSize" class="pageSize" value="${students.pageSize}">
        </form>
    </c:if>
    <c:if test="${searchCondition == null or searchCondition == ''}">
        <form id="sf" method="post" action="${pageContext.request.contextPath}/findStudentByConditions">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <span class="label label-primary">ID</span><input class="search" type="text" name="id"> &nbsp;&nbsp;&nbsp;&nbsp;
            <span class="label label-primary">姓名</span><input class="search" type="text" name="name">&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="label label-primary">地址</span>
            <input id="last-search" class="search" type="text" name="address">&nbsp;&nbsp;&nbsp;
            <input class="btn-primary btn" type="submit" value="搜索"/>
            &nbsp;&nbsp;
            <input class="btn btn-primary" type="reset" value="重置">
            &nbsp;&nbsp;
            <button onclick="add()" class="btn btn-primary">增加学生</button>
            &nbsp;&nbsp;
            <button onclick="logout()" class="btn btn-primary">退出</button>
            <input type="hidden" name="pageNum" class="pageNum" value="${students.pageNum}">
            <input type="hidden" name="pageSize" class="pageSize" value="${students.pageSize}">
        </form>
    </c:if>

</div>
<table class="table" width="1200px">
    <thead>
    <tr>
        <th scope="col">姓名</th>
        <th scope="col">年龄</th>
        <th scope="col">性别</th>
        <th scope="col">电话</th>
        <th scope="col">地址</th>
        <th scope="col">状态</th>
        <th scope="col">Id</th>
        <th scope="col" colspan="2">操作</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${student != null and student != ''}">
        <tr>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.gender}</td>
            <td>${student.number}</td>
            <td>${student.address}</td>
            <td>${student.status}</td>
            <td>${student.id}</td>
            <td colspan="2">
                <button onclick="deleteUser(${student.id})" type="button" class="btn btn-danger">删除</button>
                &nbsp;&nbsp;&nbsp;
                <button onclick="editUser(${student.id})" type="button" class="btn btn-success">修改</button>
            </td>
        </tr>
    </c:if>
    <c:if test="${students != null and students != ''}">
        <c:forEach items="${students.list}" var="student">
            <tr>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>${student.gender}</td>
                <td>${student.number}</td>
                <td>${student.address}</td>
                <td>${student.status}</td>
                <td>${student.id}</td>
                <td colspan="2">
                    <button onclick="deleteUser(${student.id})" type="button" class="btn btn-danger">删除</button>
                    &nbsp;&nbsp;&nbsp;
                    <button onclick="editUser(${student.id})" type="button" class="btn btn-success">修改</button>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
    <tr>
        <td colspan="8"><c:if test="${noStudents != null}">
            ${noStudents}
        </c:if></td>
    </tr>
</table>
<c:if test="${students != null and students != ''}">
    <nav aria-label="Page navigation"  style="height: 78px; margin: 0 auto;">
        <ul class="pagination" style="display: inline-block">
            <li id="first"><a href="javascript:void(0)">首页</a></li>
            <li id="prev">
                <a href="javascript:void(0)" aria-label="Previous">
                    上一页
                </a>
            </li>
                <%--                循环页码列表--%>
            <c:forEach items="${students.navigatepageNums}" var="i">
                <%--                    <li name="pageNum" <c:if test="${i == students.pageNum}">class="active" </c:if><a href="#">${i}</a></li>--%>
                <li name="pageNum"
                        <c:if test="${i == students.pageNum}">class="active" </c:if> >
                    <a href="javascript:void(0)">${i}</a>
                </li>
            </c:forEach>
            <li id="next">
                <a href="javascript:void(0)" aria-label="Next">
                    下一页
                </a>
            </li>
            <li id="last"><a href="javascript:void(0)">末页</a></li>
        </ul>
            <div style="display: inline-block">
                共条${students.total}记录，共${students.pages}页，
                每行
                <select id="setRows">
                    <option value="5" <c:if test="${5 == students.pageSize}"> selected</c:if> >5</option>
                    <option value="10" <c:if test="${10 == students.pageSize}"> selected</c:if>>10</option>
                    <option value="15" <c:if test="${15 == students.pageSize}"> selected</c:if>>15</option>
                    <option value="20" <c:if test="${20 == students.pageSize}"> selected</c:if>>20</option>
                </select>
                条记录
            </div>
    </nav>
</c:if>
<!-- NO.1 加载框架依赖的jQuery文件(压缩版)，版本是1.12.4 -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- NO.2 加载Bootstrap的所有JS插件，版本是3.3.7 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
<script>
    function add() {
        window.location.href = "${pageContext.request.contextPath}/toAdd"
    }

    var result = "${msg}";
    if (result == "登陆成功") {
        swal("success", "登陆成功!", "success")
    }

    function deleteUser(id) {
        swal({
            title: "你确定吗?",
            text: "一旦删除，将无法恢复!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
                if (willDelete) {
                    window.location.href = "${pageContext.request.contextPath}/deleteStudent?id=" + id
                    swal("数据已成功删除！", {
                        icon: "success",
                    });
                } else {
                    swal("您的数据是安全的！");
                }
            });
    }

    function editUser(id) {
        window.location.href = "${pageContext.request.contextPath}/toEdit?id=" + id
    }

    function logout() {
        window.location.href = "${pageContext.request.contextPath}/doLogout"
    }

    function add() {
        window.location.href = "${pageContext.request.contextPath}/toAdd"
        window.event.returnValue = false
    }

</script>
<script>
    <%--        分页--%>
    // 1.初始化页数信息
    // 当前页数
    var pageNum = ${students.pageNum};
    // 总页数
    var pages = ${students.pages};
    // 有无上一页
    var hasPre = ${students.hasPreviousPage};
    // 有无下一页
    var hasNext = ${students.hasNextPage};
    // 2. 判断按钮状态
    if (!hasPre) {
        $("#prev").addClass("disabled");
        $("#first").addClass("disabled");
    }
    if (!hasNext) {
        $("#next").addClass("disabled");
        $("#last").addClass("disabled");
    }
    //3. 按钮事件监听
    $("#first").click(function () {
        if (!$("#first").hasClass("disabled")) {
            $(".pageNum").val(1);
            $("#sf").submit();
        }
    })
    $("#prev").click(function () {
        if (!$("#prev").hasClass("disabled")) {
            $(".pageNum").val(pageNum - 1);
            $("#sf").submit();
        }
    })
    $("#next").click(function () {
        if (!$("#next").hasClass("disabled")) {
            $(".pageNum").val(pageNum + 1);
            $("#sf").submit();
        }
    })
    $("#last").click(function () {
        if (!$("#last").hasClass("disabled")) {
            $(".pageNum").val(pages);
            $("#sf").submit();
        }
    })
    // 点击每一页
    $("li[name='pageNum']").click(function(){
        if(!($(this).hasClass("active"))){
            $(".pageNum").val($(this).children("a").html());
            $("#sf").submit();
        }
    })

    // 每页行数
    $("#setRows").change(function (){
        $(".pageSize").val($(this).val());
        $(".pageNum").val(1);
        $("#sf").submit();
    })

</script>
</body>
</html>
