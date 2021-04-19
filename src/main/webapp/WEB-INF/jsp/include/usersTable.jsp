
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.springboot.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/20
  Time: 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserTable</title>
</head>
<body>
<%
    ArrayList<User> users = (ArrayList<User>)session.getAttribute("users");
%>
<center>
    <table border="0" cellspacing="0" cellpadding="0" frame="box" width="1000" style="border-color: deeppink"  rules="all" >
        <tr align="center" style="background-color: khaki">
            <td><label>注册时间</label></td>
            <td><label>用户名</label></td>
            <td><label>密码</label></td>
            <td><label>用户类型</label></td>
            <td><label>邮箱</label></td>
            <td><label>电话</label></td>
            <td><label>操作</label></td>
        </tr>
        <%
            for (User user : users) {
        %>
        <tr style="background-color: bisque" align="center">
            <td><label><%=user.getId()%></label></td>
                <td><label><%=user.getUsername()%></label></td>
            <td><label><%=user.getPassword()%></label></td>
            <td><label><%=user.getType()%></label></td>
            <td><label><%=user.getEmail()%></label></td>
            <td><label><%=user.getNumber()%></label></td>
            <td>
                <%
                    String EditId = user.getId();
                    System.out.println(EditId);
                %>
                <label><a href="/AdminEditPage/<%=EditId%>">修改</a></label>
                <label><a href="/delete/<%=EditId%>">删除</a></label>
            </td>
        </tr>
        <%
            }
        %>
    </table>

</center>
</body>
</html>
