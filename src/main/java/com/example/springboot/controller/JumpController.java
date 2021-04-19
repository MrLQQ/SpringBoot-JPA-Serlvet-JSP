package com.example.springboot.controller;

import com.example.springboot.DAO.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class JumpController {

    @Autowired
    UserDAO userDAO;

    @RequestMapping("/index")
    public String hello() {
        return "login";
    }

    @RequestMapping("/Register")
    public String register(){
        return "register";
    }

    @RequestMapping("/UserEditPage")
    public String UserEditPage(){
        return "edit/UserEditPage";
    }

    @RequestMapping("/AddUser")
    public String AddUser(){
        return "edit/AddUser";
    }

    @RequestMapping("/AdminEditPage/{EditId}")
    public String AdminEditPage(@PathVariable String EditId, HttpServletRequest request ){
        request.setAttribute("User", userDAO.Read(EditId,"id"));
        return "edit/AdminEditPage";
    }
}