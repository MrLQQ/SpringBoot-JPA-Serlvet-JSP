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
public class AddUserController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping("/addUser")
    public void AddUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        User user = new User(username, password, type, email, phone);

        if (userDAO.Read(user.getUsername(), "username") != null) {

            request.setAttribute("msg", "occupy");   // 被占用
            request.getRequestDispatcher("/WEB-INF/jsp/edit/AddUser.jsp").forward(request, response);

        } else {
            userDAO.Create(user);

            // 向管理员界面的表格传递用户列表
            session.setAttribute("users", userDAO.getUsers());
            request.getRequestDispatcher("/WEB-INF/jsp/admin/admin_index.jsp").forward(request, response);
        }

    }
}
