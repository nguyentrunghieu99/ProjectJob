/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service;

import com.nth.pojos.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author Hieu
 */
public interface UserService extends UserDetailsService{
    boolean addUser(User user);
    void uppdateUser(User user,String pass);
    List<User> getUsers(String username);
    List<User> getUsers();
    User getUserById(int userId);
    void deleteUser(int Id);
    void sendAppliNtd(User user);
    List<User> getUsersByActive();
    void agreeNtd(int userId);
    void refuseNtd(int userId);
}
