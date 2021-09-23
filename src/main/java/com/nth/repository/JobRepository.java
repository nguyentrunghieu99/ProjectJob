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
    List<Job> getJobs(String kw,int page);
    long countJob();
    boolean addOrUpdate(Job job);
}
