<%@ page import="com.example.springboot.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/19
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    // 获取要被修改的用户User
    User InternalUser = (User) session.getAttribute("InternalUser");

//    // 向下一个页面传递被修改的User
//    request.setAttribute("user", InternalUser);
%>
<body>
<%--导航栏--%>
<jsp:include page="../include/nav_user.jsp">
    <jsp:param name="title" value="信息修改"/>
</jsp:include>

<center>
    <form action="/userEdit"  method="post" onsubmit="return submitCheck();">
        <table frame="box" style="border-color: deeppink; background-color: bisque"  >

            <tr>
                <td><label>用户名:</label></td>
                <td><input type="text" name="username" required="required" id="login name" value="<%=InternalUser.getUsername()%>" /></td>
            </tr>
            <tr>
                <td><label>密码:</label></td>
                <td><input type="password" name="password" id="password"  required="required"  value="" /></td>
            </tr>
            <tr>
                <td><label>重复密码:</label></td>
                <td><input type="password" name="re_password" id="re_password"  required="required"  value="" /></td>
            </tr>
            <tr>
                <td><label>邮件:</label></td>
                <td><input type="email" name="email" id="email"  required="required"  value="<%=InternalUser.getEmail()%>" /></td>
            </tr>
            <tr>
                <td><label>电话:</label></td>
                <td><input type="text" name="phone" id="phone"  required="required"  value="<%=InternalUser.getNumber()%>" /></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="submit" value="修改" /></td>
            </tr>
        </table>
    </form>
    <script language="JavaScript">
        function submitCheck(){
            var password = document.getElementById("password").value;
            var re_password = document.getElementById("re_password").value;
            if (password===re_password){
                return true;
            } else {
                alert("两次不一致，请检查后重新注册！");
                return false;
            }
        }
    </script>
</center>
</body>
</html>
