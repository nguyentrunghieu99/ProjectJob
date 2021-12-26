/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository.impl;

import com.nth.pojos.Job;
import com.nth.pojos.Location;
import com.nth.repository.LocationRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
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
@Transactional
@Repository
public class LocationRepositoryImpl implements LocationRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Location getLocationById(int locaId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        
        return s.get(Location.class, locaId);
    }

    @Override
    public List<Location> getLocation() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Location");
        return q.getResultList();
    }

}
