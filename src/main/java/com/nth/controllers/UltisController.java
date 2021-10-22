/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;

import com.nth.service.JobService;
import com.nth.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Hieu
 */
@Controller
public class UltisController {
    
    @Autowired
    private LocationService locationService;
    
    @Autowired
    private JobService jobService;
    
    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }
    
    @RequestMapping("/admin/jobs")
    public String jobManager(Model model){
        model.addAttribute("location", this.locationService.getLocationById(1));
        return "managerjob";
    }

}
