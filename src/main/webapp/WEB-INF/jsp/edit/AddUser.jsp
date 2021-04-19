<%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/16
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AddUser</title>
</head>
<body>
<%
    String registerStatus = (String) request.getAttribute("msg");
    if (registerStatus!=null){
        if(registerStatus.equals("occupy")){
            %>
            <script>
                alert("用户名已存在");
            </script>
            <%
        }else if(registerStatus.equals("success")){

        }
    }
%>
<jsp:include page="../include/nav_admin.jsp" >
    <jsp:param name="title" value="添加用户"/>
</jsp:include>
<center>
    <form action="/addUser"  method="post" onsubmit="return submitCheck();">
        <table frame="box" style="border-color: deeppink; background-color: bisque"  >

            <tr>
                <td><label>用户名:</label></td>
                <td><input type="text" name="username" required="required" id="login name" value="" /></td>
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
                <td><label>身份:</label></td>
                <td>
                    <label>管理员</label><input type="radio" name="type" id="admin"  value="管理员" />
                    <label>普通用户</label><input type="radio" name="type" id="user"  value="普通用户" checked="checked"/>
                </td>
            </tr>
            <tr>
                <td><label>邮件:</label></td>
                <td><input type="email" name="email" id="email"  required="required"  value="" /></td>
            </tr>
            <tr>
                <td><label>电话:</label></td>
                <td><input type="text" name="phone" id="phone"  required="required"  value="" /></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="submit" value="注册" /></td>
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
