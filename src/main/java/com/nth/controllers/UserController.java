/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;

import com.nth.pojos.User;
import com.nth.service.UserService;
import com.nth.validator.UserValidator;
import com.nth.validator.WebAppValidator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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

    @Autowired
    private UserValidator userValidator;

    @InitBinder("user")
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }

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
    public String register(Model model, @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) {
        String errMsg = null;

        if (!result.hasErrors()) {

            if (user.getPassword().equals(user.getConfirmPassword())) {

                if (this.userDetailsService.addUser(user) == true) {
                    return "redirect:/login";
                } else {
                    errMsg = "Đăng ký không thành công! vui lòng thử lại";
                }
            } else {
                errMsg = "Mật khẩu không khớp";
            }
        }
        model.addAttribute("errMsg", errMsg);
        return "register";
    }

    @GetMapping("/admin/user")
    public String userManager(Model model,
            @RequestParam(value = "username", required = false, defaultValue = "") String username) {
        model.addAttribute("users", this.userDetailsService.getUsers(username));
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
    public String updateUser2(Model model, @ModelAttribute(value = "user") User user,
            HttpServletRequest request) {
        this.userDetailsService.uppdateUser(user, request.getParameter("pass"));
        return "redirect:/admin/user";

    }

    @RequestMapping("/userdetail/edituser")
    public String userEditUser(Model model, HttpSession session) {
        return "user-edituser";
    }

    @PostMapping("/userdetail/edituser/success")
    public String editUser(Model model, @ModelAttribute(value = "currentUser") User user,
            HttpServletRequest request) {
        this.userDetailsService.uppdateUser(user, request.getParameter("pass"));
        return "redirect:/login";
    }
    
    @RequestMapping(path = "/userdetail")
    public String userDetail() {
        return "userdetail";
    }

    @GetMapping("/admin/ntd")
    public String getNtdManager(Model model) {
        model.addAttribute("users", this.userDetailsService.getUsersByActive());
        return "managerntd";
    }

    @PostMapping("/admin/ntd/agree")
    public String AgreeNTD(Model model, HttpServletRequest request) {
        this.userDetailsService.agreeNtd(Integer.parseInt(request.getParameter("agreeNTD")));
        return "redirect:/admin/ntd";
    }

    @PostMapping("/admin/ntd/refuse")
    public String refuseNTD(Model model, HttpServletRequest request) {
        this.userDetailsService.refuseNtd(Integer.parseInt(request.getParameter("refuseNTD")));
        return "redirect:/admin/ntd";
    }

}
