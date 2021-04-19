<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.springboot.bean.User" %>
<%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/16
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<%
    ArrayList<User> users = (ArrayList<User>)session.getAttribute("users");
%>
<body>
<h5>欢迎管理员登录本网站</h5>      <%--欢迎--%>

<jsp:include page="../include/nav_admin.jsp" >
    <jsp:param name="title" value="主页面"/>
</jsp:include>
<center><font><a href="/AddUser">添加用户</a></font></center>
<jsp:include page="../include/usersTable.jsp">
    <jsp:param name="users" value="<%= users%>"/>
</jsp:include>
</body>
</html>
