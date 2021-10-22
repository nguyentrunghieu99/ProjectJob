/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service.impl;

import com.nth.pojos.Job;
import com.nth.pojos.JobLoca;
import com.nth.pojos.Location;
import com.nth.repository.LocationRepository;
import com.nth.service.LocationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hieu
 */
@Service
public class LocationServiceImpl implements LocationService {

    @Autowired
    private LocationRepository locationRepository;

    @Override
    public Location getLocationById(int locaId) {
        return this.locationRepository.getLocationById(locaId);
    }

    @Override
    public List<Location> getLocation() {
        return this.locationRepository.getLocation();
    }

    @Override
    public List<JobLoca> getJobLoca() {
        return this.locationRepository.getJobLoca();
    }

    @Override
    public boolean addJobLoca(JobLoca jobloca) {
        return this.locationRepository.addJobLoca(jobloca);
    }

}
