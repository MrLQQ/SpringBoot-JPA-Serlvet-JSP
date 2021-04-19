<%@ page import="com.example.springboot.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/16
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user</title>
</head>

<% Integer count = (Integer)application.getAttribute("count");%>
<%

    User InternalUser = (User)session.getAttribute("InternalUser");    // 获取传送过来的当前用户
%>
<body>
<h1 align="center" style="color: red">普通用户首页</h1>   <%--标题--%>
<h5>欢迎<%--<%=InternalUser.getUsername()%>--%>${sessionScope.InternalUser.username}登录本网站，您是<%--<%=count%>--%>${applicationScope.count}位访问者</h5>      <%--欢迎&计数--%>

<%--导航栏--%>
<jsp:include page="../include/nav_user.jsp">
    <jsp:param name="title" value="主界面"/>
</jsp:include>

<%--底部文字--%>
<jsp:include page="../include/bottom.jsp">
    <jsp:param name="type" value="<%=InternalUser.getUsername()%>"/>
</jsp:include>
</body>
</html>
