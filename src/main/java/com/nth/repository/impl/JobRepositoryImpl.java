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
import java.util.ArrayList;
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
    public List<Job> getJobs(String kw, int page, int cat, int loca) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Job> query = builder.createQuery(Job.class);
        Root root = query.from(Job.class);
        query = query.select(root);
        query = query.orderBy(builder.desc(root));

        List<Predicate> predicates = new ArrayList<>();

        if (!kw.isEmpty()) {
            predicates.add(builder.like(root.get("name").as(String.class),
                    String.format("%%%s%%", kw)));
        }
        if (cat > 0) {
            predicates.add(builder.equal(root.get("category"), cat));
        }

        if (loca > 0) {
            predicates.add(builder.equal(root.get("location"), loca));
        }

        query.where(predicates.toArray(new Predicate[]{}));

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
    public long countJob(String kw, int cat, int loca) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Job.class);
        List<Predicate> predicates = new ArrayList<>();

        if (!kw.isEmpty()) {
            predicates.add(builder.like(root.get("name").as(String.class),
                    String.format("%%%s%%", kw)));
        }
        if (cat > 0) {
            predicates.add(builder.equal(root.get("category"), cat));
        }

        if (loca > 0) {
            predicates.add(builder.equal(root.get("location"), loca));
        }
        query.where(predicates.toArray(new Predicate[]{}));
        query.multiselect(builder.count(root.get("id").as(Integer.class)));
        Query q = s.createQuery(query);
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Job getJobById(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        return s.get(Job.class, id);

    }

    @Override
    public List<Job> getJobsbyUser(int cate, int loca) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Job> query = builder.createQuery(Job.class);
        Root root = query.from(Job.class);
        query = query.select(root);
        query = query.orderBy(builder.desc(root));

        Predicate p1 = builder.equal(root.get("category"), cate);
        Predicate p2 = builder.equal(root.get("location"), loca);
        query = query.where(builder.and(p1, p2));

        Query q = s.createQuery(query);

        q.setMaxResults(5);
        return q.getResultList();
    }

    @Override
    public List<Job> getJobsbyNTD(int user) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Job> query = builder.createQuery(Job.class);
        Root root = query.from(Job.class);
        query = query.select(root);
        query = query.orderBy(builder.desc(root));

        Predicate p = builder.equal(root.get("user"), user);
        query = query.where(p);

        Query q = s.createQuery(query);
        return q.getResultList();
    }

    @Override
    public boolean deleteJob(Job job) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.delete(job);
            System.out.print("Xóa thành công!!!");
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
