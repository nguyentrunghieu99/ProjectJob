/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository.impl;

import com.nth.pojos.Comment;
import com.nth.pojos.Job;
import com.nth.pojos.JobLoca;
import com.nth.pojos.Location;
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
    public List<Job> getJobs(String kw, int page, int cat, int loca) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Job> query = builder.createQuery(Job.class);
        Root root = query.from(Job.class);
        query = query.select(root);
        query = query.orderBy(builder.desc(root));

        if (!kw.isEmpty()) {
            Predicate p = builder.like(root.get("name").as(String.class),
                    String.format("%%%s%%", kw));

            query = query.where(p);

        }

        if (cat > 0) {
            Predicate p1 = builder.equal(root.get("category"), cat);
            query = query.where(p1);
        }

        if (loca > 0) {
            Root rootl = query.from(Location.class);
            Root rootjl = query.from(JobLoca.class);

            Predicate p1 = builder.equal(root.get("id"), rootjl.get("job"));
            Predicate p2 = builder.equal(rootl.get("id"), rootjl.get("location"));
            Predicate p3 = builder.equal(rootl.get("id"), loca);
            query = query.where(builder.and(p1, p2, p3));
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
    public long countJob(String kw, int cat, int loca) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);
        Root root = query.from(Job.class);
        if (!kw.isEmpty()) {
            Predicate p = builder.like(root.get("name").as(String.class),
                    String.format("%%%s%%", kw));

            query = query.where(p);
        }

        if (cat > 0) {
            Predicate p1 = builder.equal(root.get("category"), cat);
            query = query.where(p1);
        }

        if (loca > 0) {
            Root rootl = query.from(Location.class);
            Root rootjl = query.from(JobLoca.class);
            Predicate p1 = builder.equal(root.get("id"), rootjl.get("job"));
            Predicate p2 = builder.equal(rootl.get("id"), rootjl.get("location"));
            Predicate p3 = builder.equal(rootl.get("id"), loca);
            query = query.where(builder.and(p1, p2, p3));

        }
        query = query.multiselect(builder.count(root.get("id").as(Integer.class)));
        Query q = s.createQuery(query);

        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Job getJobById(int id) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        return s.get(Job.class, id);

    }

}
