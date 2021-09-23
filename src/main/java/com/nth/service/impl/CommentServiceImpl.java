/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service.impl;

import com.nth.repository.UserRepository;
import com.nth.pojos.Comment;
import com.nth.pojos.Job;
import com.nth.pojos.User;
import com.nth.repository.CommentRepository;
import com.nth.repository.JobRepository;
import com.nth.service.CommentService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Hieu
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<Comment> getComment(int jobId, int page) {
        return this.commentRepository.getComment(jobId, page);
    }

    @Override
    public long coutCommentById(int jobId) {
        return this.commentRepository.coutCommentById(jobId);
    }

    @Override
    public Comment addComment(String content, int jobId, int userId) {
        Job j = this.jobRepository.getJobById(jobId);
        User u = this.userRepository.getUserById(userId);

        Comment c = new Comment();
        c.setContent(content);
        c.setJob(j);
        c.setUser(u);
        c.setCreateDate(new Date());

        return this.commentRepository.addComment(c);

    }

}
