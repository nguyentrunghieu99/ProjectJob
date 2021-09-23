/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service.impl;

import com.nth.pojos.Job;
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
    public List<Location> getLocationsById(int Id) {
        return this.locationRepository.getLocationsById(Id);
    }

}
