/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nth.configs.handlers.LoginSuccessHandler;
import com.nth.configs.handlers.LogoutHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author Hieu
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.nth.repository",
    "com.nth.service"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;
    
    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;
    
    @Autowired
    private LogoutSuccessHandler logoutHandler;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");

        http.formLogin().defaultSuccessUrl("/").failureUrl("/login?error");
        http.formLogin().successHandler(this.loginSuccessHandler);
        
//        http.logout().logoutSuccessUrl("/login");
        http.logout().logoutSuccessHandler(this.logoutHandler);
        http.exceptionHandling().accessDeniedPage("/login?accessDenied");

        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/td/**").access("hasAnyRole('ROLE_ADMIN','ROLE_NTD')")
                .antMatchers("/userdetail").access("hasAnyRole('ROLE_ADMIN','ROLE_NTD','ROLE_USER')")
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/apply/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER')");

        http.csrf().disable();
    }

    @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "springmvc",
                "api_key", "177733296175764",
                "api_secret", "i_ihZ9fUicWTEj-lp9Fpvaij9Sc",
                "secure", true
        ));

        return c;
    }
    
    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler(){
        return new LoginSuccessHandler();
    }
    
    @Bean
    public LogoutSuccessHandler logoutHandler(){
        return new LogoutHandler();
    }

}
