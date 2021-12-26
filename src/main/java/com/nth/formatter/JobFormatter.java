/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.formatter;

import com.nth.pojos.Job;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Hieu
 */
public class JobFormatter implements Formatter<Job>{

    @Override
    public String print(Job j, Locale locale) {
        return String.valueOf(j.getId());
    }

    @Override
    public Job parse(String string, Locale locale) throws ParseException {
        Job j = new Job();
        j.setId(Integer.parseInt(string));
        return j;
    }
    
}
