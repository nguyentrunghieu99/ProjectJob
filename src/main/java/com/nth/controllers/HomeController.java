/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;


import com.nth.service.CategoryService;
import com.nth.service.JobService;
import com.nth.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
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
    
    @Value("${page.max.index}")
    private int maxPageIndex;
    
    @Value("${page.max.comment}")
    private int maxPageComment;
    
    
    @ModelAttribute
    public void commonAttr(Model model){
         model.addAttribute("categories", this.categoryService.getCategories());
//         model.addAttribute("locations", this.locationService.getLocationsById(0));
         model.addAttribute("maxIn", maxPageIndex);
         model.addAttribute("maxComm", maxPageComment);
         
         
    }
    
    @RequestMapping(value = "/")
    public String index(Model model, 
           @RequestParam(value = "kw",required = false, defaultValue = "") String kw,
           @RequestParam(required = false,defaultValue = "1")Integer page){
        model.addAttribute("jobs",this.jobService.getJobs(kw,page));
        model.addAttribute("counter", this.jobService.countJob());
        return "index";
    }
    
//    @RequestMapping(path = "/show",method = RequestMethod.POST)
//    public String show(Model model, @ModelAttribute(value = "user") User user){
//        model.addAttribute("full", user.getFirstName()+ "" + user.getLastName());
//        return "index";
//    }
 
}
