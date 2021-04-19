<%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/16
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<%
    /*User InternalUser = (User)session.getAttribute("InternalUser");
    session.setAttribute("InternalUser", InternalUser);*/
%>
<body>
<%
    String title = request.getParameter("title");
%>
<h1 align="center" style="color: red">用户界面--<%=title%></h1>     <%--标题--%>
<center>
    <table border="0" cellspacing="0" cellpadding="0" frame="box" width="1000" style="border-color: deeppink" >
        <tr style="background-color: khaki">
            <td style="text-align: center;color: deeppink">热菜</td>
            <td style="text-align: center;color: deeppink">凉菜</td>
            <td style="text-align: center;color: deeppink">饮品</td>
            <td style="text-align: center;color: deeppink"><a href="/UserEditPage">修改个人信息</a></td>
            <td style="text-align: center;color: deeppink"><a href="/exit">退出系统</a></td>
        </tr>
    </table>
</center>
<hr style="border-color: darkgreen;border-width: medium">
</body>
</html>
