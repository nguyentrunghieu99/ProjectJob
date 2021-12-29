/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;


import com.nth.pojos.User;
import com.nth.service.CategoryService;
import com.nth.service.JobService;
import com.nth.service.LocationService;
import com.nth.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Hieu
 */
@Controller
@ControllerAdvice
@PropertySource("classpath:values.properties")
public class HomeController { 
    @Autowired
    private LocationService locationService;
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private JobService jobService;
    
    @Autowired
    private UserService userDetailsService;
    
    @Value("${page.max.index}")
    private int maxPageIndex;
    
    
    @ModelAttribute
    public void commonAttr(Model model,HttpSession session){
         model.addAttribute("categories", this.categoryService.getCategories());
         model.addAttribute("locations", this.locationService.getLocation());
         model.addAttribute("currentUser", session.getAttribute("currentUser"));
         model.addAttribute("jobForUser",this.jobService.getJobByUser((User)session.getAttribute("currentUser")));
    }   
    
    @RequestMapping(value = "/")
    public String index(Model model,
           @RequestParam(value = "kw",required = false, defaultValue = "") String kw,
           @RequestParam(value = "cat",required = false,defaultValue = "0")Integer cat,
           @RequestParam(value = "loca",required = false,defaultValue = "0")Integer loca,
           @RequestParam(required = false,defaultValue = "1")Integer page){
        model.addAttribute("jobs",this.jobService.getJobs(kw,page,cat,loca));
        model.addAttribute("counter", this.jobService.countJob(kw,cat,loca));
        model.addAttribute("maxIn", maxPageIndex);
        return "index";
    }
       
    @PostMapping("/")
    public String SendAppliNtd(Model model,@ModelAttribute(value = "currentUser")User user){
        this.userDetailsService.sendAppliNtd(user);
        return "redirect:/";
    }
}
