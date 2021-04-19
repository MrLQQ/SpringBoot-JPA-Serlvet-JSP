<%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/16
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    String type = request.getParameter("type");
%>
<body>
<h1 align="center" style="color: deeppink">登录人的用户名：<%=type%></h1>
</body>
</html>
