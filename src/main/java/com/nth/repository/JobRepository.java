/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository;

import com.nth.pojos.Job;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface JobRepository {
    Job getJobById(int Id);
    List<Job> getJobs(String kw,int page, int cat, int loca);
    long countJob(String kw,int cat,int loca);
    boolean addOrUpdate(Job job);
    List<Job> getJobsbyUser(int cate,int loca);
    List<Job> getJobsbyNTD(int user);
    boolean deleteJob(Job job);
}
