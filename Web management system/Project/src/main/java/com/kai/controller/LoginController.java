package com.kai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @RequestMapping("/user/login")

    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model){
        if(!StringUtils.isEmpty(username)&& "123456".equals(password)){
            session.setAttribute("loginUser",username);
            return "redirect:/main.html";
        }
        else {
            model.addAttribute("msg","Incorrect username or password");
            return "index";
        }

    }
}
