/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.validator;

import com.nth.pojos.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Hieu
 */
@Component
public class UserNameValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return User.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User u = (User) target;
        if (u.getFile().isEmpty()) {
            errors.rejectValue("file", "user.avatar");
        }
        if(!u.getPhone().matches("\\d{10}")){
            errors.rejectValue("phone", "user.phone");
        }
    }
    
}
