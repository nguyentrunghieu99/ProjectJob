/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;

import com.nth.pojos.Application;
import com.nth.pojos.Job;
import com.nth.pojos.User;
import com.nth.service.CommentService;
import com.nth.service.JobService;
import com.nth.service.LocationService;
import com.nth.service.UltisService;
import com.nth.validator.WebAppValidator;
import java.util.Map;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
public class JobController {

    @Autowired
    private JobService jobService;

    @Autowired
    private WebAppValidator jobValidator;

    @Autowired
    private LocationService locationService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private UltisService ultisService;

    @Value("${page.max.comment}")
    private int maxPageComment;

    @InitBinder("job")
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(jobValidator);
    }

    @GetMapping("/td/jobs")
    public String list(Model model) {
        model.addAttribute("job", new Job());
        return "job";
    }

    @PostMapping("/td/jobs")
    public String add(Model model, @ModelAttribute(value = "job") @Valid Job job,
            BindingResult result) {
        if (!result.hasErrors()) {
            if (this.jobService.addOrUpdate(job) == true) {

                model.addAttribute("success", "????ng b??i th??nh c??ng");
                return "redirect:/";
            } else {
                model.addAttribute("errMsg", "Something wrong");
            }
        }
        return "job";
    }

    @RequestMapping(path = "/jobs/{jobId}")
    public String info(Model model,
            HttpSession session,
            @PathVariable(value = "jobId") int jobId,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("job", this.jobService.getJobById(jobId));
        model.addAttribute("comments", this.commentService.getComment(jobId, page));
        model.addAttribute("count", this.commentService.coutCommentById(jobId));
        model.addAttribute("maxComm", maxPageComment);
        model.addAttribute("appbyjob", this.ultisService.getAppliByJobId(jobId));
        model.addAttribute("jobForUser",this.jobService.getJobByUser((User)session.getAttribute("currentUser")));
        return "jobdetail";
    }

    @RequestMapping(path = "/td/detail")
    public String tdDetail(Model model, HttpSession session) {
        model.addAttribute("jobForNTD", this.jobService.getJobByNTD((User) session.getAttribute("currentUser")));
        return "ntd-jobs";
    }

    @PostMapping("/td/detail")
    public String tdDetail(HttpServletRequest request) {
        this.jobService.deleteJob((Integer.parseInt(request.getParameter("deleteJob"))));
        return "redirect:/td/detail";
    }
}
