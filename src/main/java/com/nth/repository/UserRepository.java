/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository;

import com.nth.pojos.User;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface UserRepository {
    boolean addUser(User user);
    boolean updateUser(User user);
    List<User> getUsers();
    List<User> getUsers(String username);
    User getUserById(int userId);
    void deleteUser(int Id);
    List<User> getUsersByActive();
}
