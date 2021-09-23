/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository;

import com.nth.pojos.Job;
import com.nth.pojos.Location;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface LocationRepository {
    List<Location> getLocationsById(int Id);
    
}
