package com.example.springboot.controller;

import com.example.springboot.DAO.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class DeleteController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping("/delete/{EditId}")
    public void Delete(@PathVariable String EditId, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        System.out.println("接收EditID==>"+EditId);

        // 从数据库删除目标用户
        userDAO.Delete(EditId);
        // 更新用户列表
        session.setAttribute("users", userDAO.getUsers());

        // 跳转回管理员界面
        request.getRequestDispatcher("/WEB-INF/jsp/admin/admin_index.jsp").forward(request,response);
    }
}
