/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository;

import com.nth.pojos.Application;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface UltisRepository {
    void save(Application app);
    List<Application> getAppliByJobId(int jobId);
    List<Object[]> cateStats();
    List<Object[]> jobStats(String kw, Date fromDate, Date toDate);
    List<Object[]> applicationStats(Date fromDate, Date toDate);
}
