/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.protobuf.Message;
import com.nth.pojos.User;
import com.nth.repository.JobRepository;
import com.nth.repository.UserRepository;
import com.nth.service.UserService;
import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hieu
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService {

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public boolean addUser(User user) {
        if (!user.getFile().isEmpty()) {
            try {
                Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar((String) r.get("secure_url"));
            } catch (IOException ex) {
                System.err.println("==ADD PRODUCT==" + ex.getMessage());
            }
        }

        if (!user.getFilecv().isEmpty()) {
            try {
                Map cv = this.cloudinary.uploader().upload(user.getFilecv().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setCv((String) cv.get("secure_url"));
            } catch (IOException ex) {
                System.err.println("==ADD PRODUCT==" + ex.getMessage());
            }
        }

        if(!user.getPassword().isEmpty()){
            String pass = user.getPassword();
            user.setPassword(this.passwordEncoder.encode(pass));
        }
            user.setUserRole(User.USER);
            user.setActive(1);
            
        return this.userRepository.addUser(user);
    }

    @Override
    public List<User> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username);

        if (users.isEmpty()) {
            throw new UsernameNotFoundException("User không tồn tại");
        }
        User user = users.get(0);
        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(user.getUserRole()));

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), auth);
    }

    @Override
    public User getUserById(int userId) {
        return this.userRepository.getUserById(userId);
    }

    @Override
    public boolean uppdateUser(User user, String pass) {

        if (!user.getFile().isEmpty()) {
            try {
                Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar((String) r.get("secure_url"));;
            } catch (IOException ex) {
                System.err.println("==ADD PRODUCT==" + ex.getMessage());
            }
        }

        if (!user.getFilecv().isEmpty()) {
            try {
                user.setCv("");
                Map cv = this.cloudinary.uploader().upload(user.getFilecv().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                user.setCv((String) cv.get("secure_url"));
            } catch (IOException ex) {
                System.err.println("==ADD PRODUCT==" + ex.getMessage());
            }
        }
        if ((user.getActive() == 0 || user.getActive() == 1) && "ROLE_NTD".equals(user.getUserRole())) {
            user.setActive(2);
        }
        if (user.getActive() == 2 && "ROLE_USER".equals(user.getUserRole())) {
            user.setActive(0);
        }
        if (!pass.isEmpty() && pass.length() > 5) {
            String password = this.passwordEncoder.encode(pass);
            user.setPassword(password);
        }
        if(user.getAge()<15){
            user.setAge(15);
        }
        if(user.getAge()>70){
            user.setAge(70);
        }
        return this.userRepository.updateUser(user);
    }

    @Override
    public List<User> getUsers() {
        return this.userRepository.getUsers();
    }

    @Override
    public void deleteUser(int Id) {
        this.userRepository.deleteUser(Id);
    }

    @Override
    public void sendAppliNtd(User user) {
        user.setActive(1);
        this.userRepository.updateUser(user);
    }

    @Override
    public List<User> getUsersByActive() {
        return this.userRepository.getUsersByActive();
    }

    @Override
    public void agreeNtd(int userId) {
        User u = this.getUserById(userId);
        u.setActive(2);
        u.setUserRole("ROLE_NTD");
        this.userRepository.updateUser(u);
    }

    @Override
    public void refuseNtd(int userId) {
        User u = this.getUserById(userId);
        u.setActive(0);
        u.setUserRole("ROLE_USER");
        this.userRepository.updateUser(u);
    }
}
