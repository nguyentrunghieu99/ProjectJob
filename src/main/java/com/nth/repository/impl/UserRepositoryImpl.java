/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository.impl;

import com.nth.pojos.User;
import com.nth.repository.UserRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Hieu
 */
@Repository
@Transactional
public class UserRepositoryImpl implements UserRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public boolean addUser(User user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(user);
            return true;
        } catch (HibernateException ex) {
            s.clear();
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        if (!username.isEmpty()) {
            Predicate p1 = builder.like(root.get("username").as(String.class), String.format("%%%s%%", username));
            Predicate p2 = builder.equal(root.get("userRole").as(String.class), username.trim());
            query = query.where(builder.or(p1, p2));
        }
        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public User getUserById(int userId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        return s.get(User.class, userId);
    }

    @Override
    public List<User> getUsers() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From User");

        return q.getResultList();
    }

    @Override
    public void deleteUser(int Id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        User u = s.byId(User.class).load(Id);
        s.delete(u);

    }

    @Override
    public boolean updateUser(User user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.update(user);
//            s.clear();
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }


    @Override
    public List<User> getUsersByActive() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("active").as(Integer.class), 2);
        query = query.where(p);
        Query q = s.createQuery(query);
        return q.getResultList();
    }

}
