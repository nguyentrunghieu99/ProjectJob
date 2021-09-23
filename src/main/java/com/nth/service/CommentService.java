/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.service;

import com.nth.pojos.Comment;
import com.nth.repository.CommentRepository;
import java.util.List;

/**
 *
 * @author Hieu
 */
public interface CommentService {
    List<Comment> getComment(int jobId, int page);
    long coutCommentById(int jobId);
    Comment addComment(String content, int jobId, int userId);
}
