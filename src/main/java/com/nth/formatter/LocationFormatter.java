/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.formatter;

import com.nth.pojos.Location;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Hieu
 */
public class LocationFormatter implements Formatter<Location> {

    @Override
    public String print(Location object, Locale locale) {
        return String.valueOf(object.getId());
    }

    @Override
    public Location parse(String locaId, Locale locale) throws ParseException {
        Location l = new Location();
        l.setId(Integer.parseInt(locaId));
        return l;
    }

}
