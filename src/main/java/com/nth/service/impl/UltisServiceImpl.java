/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service.impl;

import com.nth.pojos.Application;
import com.nth.repository.UltisRepository;
import com.nth.service.UltisService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hieu
 */
@Service
public class UltisServiceImpl implements UltisService{
    @Autowired
    private UltisRepository ultisRepository;

    @Override
    public void save(Application app) {
        app.setApplyDate(new Date());
        this.ultisRepository.save(app);
    }

    @Override
    public List<Application> getAppliByJobId(int i) {
        return this.ultisRepository.getAppliByJobId(i);
    }

    @Override
    public List<Object[]> cateStats() {
        return this.ultisRepository.cateStats();
    }

    @Override
    public List<Object[]> jobStats(String string, Date fromDate, Date toDate) {
        return this.ultisRepository.jobStats(string, fromDate, toDate);
    }

    @Override
    public List<Object[]> applicationStats(Date toDate, Date fromDate) {
        return this.ultisRepository.applicationStats(toDate, fromDate);
    }
   
}
