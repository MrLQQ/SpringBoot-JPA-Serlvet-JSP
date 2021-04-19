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
public class AdminEditController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping("/adminEdit")
    public void AdminEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 获取修改页面信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // 获取被修改的用户
        User user = (User) session.getAttribute("User");

        // 修改user的信息
        user.setUsername(username);
        user.setPassword(password);
        user.setType(type);
        user.setEmail(email);
        user.setNumber(phone);

        // 修改数据库的内容
        userDAO.Update(user);

        // 更新用户列表
        session.setAttribute("users", userDAO.getUsers());

        // 跳转回管理员界面
        request.getRequestDispatcher("/WEB-INF/jsp/admin/admin_index.jsp").forward(request, response);
    }
}
