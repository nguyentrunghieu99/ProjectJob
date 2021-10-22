/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.formatter;

import com.nth.pojos.Job;
import com.nth.pojos.JobLoca;
import com.nth.pojos.Location;
import com.nth.service.JobService;
import com.nth.service.LocationService;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

/**
 *
 * @author Hieu
 */
public class JobLocaFormatter implements Formatter<JobLoca>{
    @Autowired
    private JobService jobService;
    
    @Autowired
    private LocationService locationService;

    @Override
    public String print(JobLoca t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public JobLoca parse(String locaId, Locale locale) throws ParseException {
        JobLoca jl = new JobLoca();

        return jl;
    }
    
}
