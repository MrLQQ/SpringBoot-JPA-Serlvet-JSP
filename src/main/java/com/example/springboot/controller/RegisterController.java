package com.example.springboot.controller;

import com.example.springboot.bean.User;
import com.example.springboot.DAO.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class RegisterController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping("/register")
    public void Register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 创建session获取器
        HttpSession session = request.getSession(true);


        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = "普通用户";
        String email = request.getParameter("email");
        String phone = request.getParameter("number");
        User user = new User(username,password, type,email, phone);


        if(userDAO.Read(user.getUsername(),"username")!=null){
            request.setAttribute("msg","occupy");   // 被占用
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request,response);

        }else{
            userDAO.Create(user);
            request.setAttribute("msg","success");   // 注册成功
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        }

    }
}
