/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nth.pojos.Job;
import com.nth.pojos.User;
import com.nth.repository.JobRepository;
import com.nth.repository.UserRepository;
import com.nth.service.JobService;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Hieu
 */
@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private JobRepository jobRepository;

    @Override
    public List<Job> getJobs(String kw, int page) {
        return this.jobRepository.getJobs(kw, page);
    }

    @Override
    public boolean addOrUpdate(Job job) {

        try {
            Map r = this.cloudinary.uploader().upload(job.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            job.setImage((String) r.get("secure_url"));
            job.setCreateDate(new Date());

            return this.jobRepository.addOrUpdate(job);

        } catch (IOException ex) {
            System.err.println("==ADD PRODUCT==" + ex.getMessage());
        }
        return false;
    }

    @Override
    public long countJob() {
        return this.jobRepository.countJob();
    }

    @Override
    public Job getJobById(int id) {
        return this.jobRepository.getJobById(id);
    }

}
