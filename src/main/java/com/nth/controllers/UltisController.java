/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;

import com.nth.pojos.Application;
import com.nth.pojos.User;
import com.nth.service.JobService;
import com.nth.service.LocationService;
import com.nth.service.UltisService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class UltisController {

    @Autowired
    private LocationService locationService;

    @Autowired
    private UltisService ultisService;

    @Autowired
    private JobService jobService;

    @RequestMapping("/admin")
    public String admin(Model model, @RequestParam(value = "test", required = false, defaultValue = "0") int test) {
        model.addAttribute("testa", test);
        return "admin";
    }

//    @PostMapping("/admin")
//    public String test(Model model,
//            HttpServletRequest request){
//        model.addAttribute("test", request.getParameter("test"));
//        return "admin";
//    }
    @RequestMapping("/admin/jobs")
    public String jobManager(Model model,
            @RequestParam(value = "kw", required = false, defaultValue = "") String kw,
            @RequestParam(value = "cat", required = false, defaultValue = "0") Integer cat,
            @RequestParam(value = "loca", required = false, defaultValue = "0") Integer loca,
            @RequestParam(required = false, defaultValue = "1") Integer page) {
        model.addAttribute("jobs", this.jobService.getJobs(kw, page, cat, loca));
        model.addAttribute("counter", this.jobService.countJob(kw, cat, loca));
        model.addAttribute("maxIn", 20);
        model.addAttribute("location", this.locationService.getLocationById(1));
        return "managerjob";
    }

    @PostMapping("/admin/jobs")
    public String jobManager(HttpServletRequest request) {
        this.jobService.deleteJob((Integer.parseInt(request.getParameter("deleteJob"))));
        return "redirect:/admin/jobs";
    }

    @RequestMapping(path = "/apply/{jobId}")
    public String applyJob(Model model,
            @PathVariable(value = "jobId") int jobId) {
        model.addAttribute("application", new Application());
        model.addAttribute("job", this.jobService.getJobById(jobId));
        return "jobapply";
    }

    @PostMapping("/apply/{jobId}")
    public String applyJobb(Model model,
            @ModelAttribute(value = "application") Application appli) {
        this.ultisService.save(appli);
        return "redirect:/";
    }

    @PostMapping("/td/detail/applications")
    public String listApply(Model model,
            HttpServletRequest request) {
        model.addAttribute("jobId", this.ultisService.getAppliByJobId(Integer.parseInt(request.getParameter("jobId"))));
        return "ntd-apply";
    }

    @RequestMapping(path = "/admin/cate-stats")
    public String cateStats(Model model) {
        model.addAttribute("cateStats", this.ultisService.cateStats());
        return "cate-stats";
    }

    @RequestMapping(path = "/admin/job-stats")
    public String jobStats(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String kw = params.getOrDefault("kw", null);

        Date fromDate = null, toDate = null;
        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);
            if (to != null) {
                toDate = f.parse(to);
            }

        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        model.addAttribute("jobStats", this.ultisService.jobStats(kw, fromDate, toDate));
        return "job-stats";
    }
    
    @RequestMapping(path = "/admin/appli-stats")
    public String applicationStats(Model model,@RequestParam(required = false) Map<String, String> params){
        
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        
        Date fromDate = null, toDate = null;
        try {
            String from = params.getOrDefault("fromDate", null);
            if (from != null) {
                fromDate = f.parse(from);
            }

            String to = params.getOrDefault("toDate", null);
            if (to != null) {
                toDate = f.parse(to);
            }

        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        
        model.addAttribute("appliStats", this.ultisService.applicationStats(fromDate, toDate));
        return "application-stats";
    }
}
