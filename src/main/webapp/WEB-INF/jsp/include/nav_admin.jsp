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
<body>
<%
    String title = request.getParameter("title");
%>
<h1 align="center" style="color: red">管理界面--<%=title%></h1>     <%--标题--%>
<center>
    <table border="0" cellspacing="0" cellpadding="0" frame="box" width="1000" style="border-color: deeppink" >
        <tr style="background-color: khaki">
            <td style="text-align: center;color: deeppink">用户管理</td>
            <td style="text-align: center;color: deeppink">菜品管理</td>
            <td style="text-align: center;color: deeppink">菜品分类管理</td>
            <td style="text-align: center;color: deeppink">查看用户点餐情况</td>
            <td style="text-align: center;color: deeppink"><a href="/exit">退出系统</a></td>
        </tr>
    </table>
</center>
<hr style="border-color: darkgreen;border-width: medium">
</body>
</html>
