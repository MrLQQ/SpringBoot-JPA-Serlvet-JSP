package com.example.springboot.controller;

import com.example.springboot.bean.User;
import com.example.springboot.DAO.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping("/login")
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 创建session获取器
        HttpSession session = request.getSession(true);
        // 创建application获取器
        ServletContext application = request.getSession().getServletContext();

        String login_username = request.getParameter("login_username");
        String login_password = request.getParameter("login_password");

        // 查找目标用户
//        User InternalUser=userData.Read(login_username,"username");
        User InternalUser= userDAO.Read(login_username,"username");
        if(InternalUser!=null){
            // 不为空，说明找到目标用户
            if (InternalUser.getPassword().equals(login_password)){
                // 密码正确
                if (InternalUser.getType().equals("管理员")){
                    // 身份是管理员

                    /*    <jsp:forward page="admin/admin_index.jsp"></jsp:forward>*/
                    session.setAttribute("users", userDAO.getUsers());
                    request.getRequestDispatcher("/WEB-INF/jsp/admin/admin_index.jsp").forward(request,response);

                }else {
                    // 身份是普通用户

                    Integer count = (Integer) application.getAttribute("count");
                    if (count == null){
                        count=0;
                    }
                    count++;
                    application.setAttribute("count",count);
                    session.setAttribute("InternalUser",InternalUser);
                    request.getRequestDispatcher("/WEB-INF/jsp/user/user_index.jsp").forward(request,response);


                }
            }else {
                // 密码不正确
                request.setAttribute("msg","error");   // 用户密码错误
                request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            }
        }else {
            // 没找到目标用户

            request.setAttribute("msg","nobody");   // 用户不存在
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        }

    }
}