/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository.impl;

import com.nth.pojos.Job;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.nth.repository.JobRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;

/**
 *
 * @author Hieu
 */
@Repository
@Transactional
@PropertySource("classpath:values.properties")
public class JobRepositoryImpl implements JobRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Value("${page.max.index}")
    private int max;

    @Override
    public List<Job> getJobs(String kw, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Job> query = builder.createQuery(Job.class);
        Root root = query.from(Job.class);
        query = query.select(root);
        query = query.orderBy(builder.desc(root.get("id")));

        if (!kw.isEmpty() && kw != null) {
            Predicate p = builder.like(root.get("name").as(String.class),
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }

        Query q = s.createQuery(query);

        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);

        return q.getResultList();

    }

    @Override
    public boolean addOrUpdate(Job job) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(job);
            System.out.print("Đăng tin thành công!!!");
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public long countJob() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Job");
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Job getJobById(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
//        Query q = s.createQuery("From Job WHERE id=:id");
//        q.setParameter("id", id);
//        return (Job) q.getSingleResult();
        return s.get(Job.class, id);

    }

}
