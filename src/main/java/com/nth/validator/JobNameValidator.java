/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.validator;

import com.nth.pojos.Job;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Hieu
 */
@Component
public class JobNameValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Job.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Job j = (Job) target;
        if (j.getDescription().isEmpty()) {
            errors.rejectValue("description", "job.description.nullErr");
        }

        if (j.getName().isEmpty()) {
            errors.rejectValue("name", "job.name.nullErr");
        }

        if (j.getFile().isEmpty()) {
            errors.rejectValue("file", "job.image.nullErr");
        }

    }
}
