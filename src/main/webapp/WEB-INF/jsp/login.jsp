<%--
  Created by IntelliJ IDEA.
  User: LQQ
  Date: 2021/3/16
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<%
    String LoginStatus =(String)request.getAttribute("msg");
    if (LoginStatus!=null){
        if(LoginStatus.equals("error")){
                %>
                <script>
                    alert("用户名密码错误");
                </script>
                <%
        }else if(LoginStatus.equals("success")){
                %>
                <script>
                    alert("注册成功！");
                </script>
                <%
            }else if(LoginStatus.equals("nobody")){
                %>
                <script>
                    alert("用户不存在！");
                </script>
                <%
            }
    }
    %>
<body>
<center>
    <h1 style="color: deeppink">欢迎登录</h1>
    <font  style="text-align: center;color: red">返回首页</font>
    <form action="/login"  method="post">
        <table frame="box" style="border-color: deeppink; background-color: bisque" >
            <tr>
                <td style="text-align: right"><label>用户名:</label></td>
                <td><input type="text" name="login_username" required="login_username" id="login name" value="" /></td>
            </tr>
            <tr>
                <td style="text-align: right"><label>密码:</label></td>
                <td><input type="password" name="login_password" id="login_password" value="" /></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <input type="submit" value="提交" />
                    <button onclick="window.location.href='/Register'">注册</button>
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
