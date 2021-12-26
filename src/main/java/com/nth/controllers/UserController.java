/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;

import com.nth.pojos.User;
import com.nth.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Hieu
 */
@Controller
public class UserController {

    @Autowired
    private UserService userDetailsService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") User user) {
        String errMsg = "";
        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userDetailsService.addUser(user) == true) {
                return "redirect:/login";
            } else {
                errMsg = "Đã có lỗi";
            }
        } else {
            errMsg = "Mật khẩu không khớp";
        }
        model.addAttribute("errMsg", errMsg);
        return "register";
    }

    @GetMapping("/admin/user")
    public String userManager(Model model,
            @RequestParam(value = "username", required = false, defaultValue = "") String username) {
//            @RequestParam(value = "role", required = false, defaultValue = "")String role) {
        model.addAttribute("users", this.userDetailsService.getUsers(username));
//        model.addAttribute("users", this.userDetailsService.getUsers(role));
        return "userinfo";
    }

    @PostMapping("/admin/user")
    public String deleteUser(HttpServletRequest request) {
        this.userDetailsService.deleteUser((Integer.parseInt(request.getParameter("deleteUser"))));
        return "redirect:/admin/user";
    }   

    @GetMapping("/admin/user/edit")
    public String adminEditUser(Model model) {
        return "edituser";
    }

    @PostMapping("/admin/user/edit")
    public String editUser(Model model, HttpServletRequest request) {
        model.addAttribute("user", this.userDetailsService.getUserById(Integer.parseInt(request.getParameter("updateUser"))));
        return "edituser";
    }

    @PostMapping("/admin/user/edit-success")
    public String updateUser2(Model model,@ModelAttribute(value = "user")User user) {
        this.userDetailsService.uppdateUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/userdetail/edituser")
    public String userEditUser(Model model, HttpSession session) {
        model.addAttribute("currentUser", session.getAttribute("currentUser"));
        return "user-edituser";
    }

    @PostMapping("/userdetail/edituser")
    public String editUser(@ModelAttribute(value = "currentUser") User user) {
        this.userDetailsService.uppdateUser(user);
        return "redirect:/userdetail";
    }
    
    @RequestMapping(path = "/userdetail")
    public String userDetail(){
        return "userdetail";
    }

    @GetMapping("/admin/ntd")
    public String getNtdManager(Model model) {
        model.addAttribute("users", this.userDetailsService.getUsersByActive());
        return "managerntd";
    }

    @GetMapping("/admin/ntd/{id}")
    public String NtdManager(Model model,
            @PathVariable(value = "id") int id,
            @RequestParam(value = "result", defaultValue = "null") boolean result) {
        model.addAttribute("accept", this.userDetailsService.acceptNtd(id, result));
        return "redirect:/admin/ntd";
    }

}
