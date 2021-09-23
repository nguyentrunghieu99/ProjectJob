/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.repository.impl;

import com.nth.pojos.Comment;
import com.nth.pojos.Job;
import com.nth.repository.CommentRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Hieu
 */
@Repository
@Transactional
@PropertySource("classpath:values.properties")
public class CommentRepositoryImpl implements CommentRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Value("${page.max.comment}")
    private int max;

    @Override
    public List<Comment> getComment(int jobId, int page) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = s.getCriteriaBuilder();
        CriteriaQuery<Comment> query = builder.createQuery(Comment.class);
        Root root = query.from(Comment.class);
        query = query.select(root);
        query = query.where(builder.equal(root.get("job"), jobId));
        query = query.orderBy(builder.desc(root.get("id")));

        Query q = s.createQuery(query);
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        return q.getResultList();
    }

    @Override
    public long coutCommentById(int jobId) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("Select Count(*) From Comment WHERE job.id =:id");
        q.setParameter("id", jobId);
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public Comment addComment(Comment c) {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        try {
            s.save(c);

            return c;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
