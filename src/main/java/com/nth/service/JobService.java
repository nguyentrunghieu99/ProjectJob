/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service;

import com.nth.pojos.Job;
import com.nth.pojos.User;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface JobService {
    Job getJobById(int Id);
    List<Job> getJobs(String kw, int page,int cat, int loca);
    long countJob(String kw, int cat, int loca);
    boolean addOrUpdate(Job job);
    List<Job> getJobByUser(User user);
    List<Job> getJobByNTD(User user);
    boolean deleteJob(int job);
}
