/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository.impl;

import com.google.common.base.Predicates;
import com.nth.pojos.Application;
import com.nth.pojos.Category;
import com.nth.pojos.Job;
import com.nth.repository.UltisRepository;
import java.util.ArrayList;
import java.util.Date;
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
public class UltisRepositoryImpl implements UltisRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public void save(Application app) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        s.save(app);
    }

    @Override
    public List<Application> getAppliByJobId(int jobId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Application> query = builder.createQuery(Application.class);
        Root root = query.from(Application.class);
        query = query.select(root);

        Predicate p = builder.equal(root.get("job"), jobId);
        query = query.where(p);
        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public List<Object[]> cateStats() {
        Session s = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootA = q.from(Application.class);
        Root rootJ = q.from(Job.class);
        Root rootC = q.from(Category.class);

        q.where(b.and(b.equal(rootC.get("id"), rootJ.get("category")), b.equal(rootA.get("job"), rootJ.get("id"))));
        q.multiselect(rootC.get("id"), rootC.get("name"), b.count(rootA.get("id")));
        q.groupBy(rootC.get("id"));

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> jobStats(String kw, Date fromDate, Date toDate) {
        Session s = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootA = q.from(Application.class);
        Root rootJ = q.from(Job.class);

        List<Predicate> predicates = new ArrayList<>();
        predicates.add(b.equal(rootA.get("job"), rootJ.get("id")));
        q.multiselect(rootJ.get("id"), rootJ.get("name"), b.count(rootA.get("id")));

        if(kw != null && !kw.isEmpty()) {
            predicates.add(b.like(rootJ.get("name"),String.format("%%%s%%", kw)));
        }
        
        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rootJ.get("createDate"), fromDate));
        }
        if (fromDate != null) {
            predicates.add(b.lessThanOrEqualTo(rootJ.get("createDate"), toDate));
        }
        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(rootJ.get("id"));
        q.orderBy(b.desc(rootJ.get("id")));
       
        

        Query query = s.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> applicationStats(Date fromDate, Date toDate) {
        Session s = this.sessionFactory.getObject().getCurrentSession();

        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootA = q.from(Application.class);

        List<Predicate> predicates = new ArrayList<>();
        q.multiselect(b.function("MONTH", Integer.class, rootA.get("applyDate")),b.function("YEAR", Integer.class, rootA.get("applyDate")),b.count(rootA.get("id")));
        
        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rootA.get("applyDate"), fromDate));
        }
        if (fromDate != null) {
            predicates.add(b.lessThanOrEqualTo(rootA.get("applyDate"), toDate));
        }
        q.where(predicates.toArray(new Predicate[]{}));
        q.groupBy(b.function("MONTH", Integer.class, rootA.get("applyDate")),b.function("YEAR", Integer.class, rootA.get("applyDate")));
        q.orderBy(b.desc(b.function("MONTH", Integer.class, rootA.get("applyDate"))));
        

        Query query = s.createQuery(q);
        return query.getResultList();
    }

}
