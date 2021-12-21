/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service;

import com.nth.pojos.Job;
import com.nth.pojos.Location;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface LocationService {
    Location getLocationById(int locaId);
    List<Location> getLocation();
//    List<JobLoca> getJobLoca();
//    boolean addJobLoca(JobLoca jobloca);
//    
}
