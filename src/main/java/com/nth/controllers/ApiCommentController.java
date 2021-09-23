/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.controllers;

import com.nth.pojos.Comment;
import com.nth.service.CommentService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Hieu
 */
@RestController
public class ApiCommentController {
    @Autowired
    private CommentService commentService;
    
    @PostMapping("/api/add-comment")
    public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params){
      try{
        String content = params.get("content");
        int jobId = Integer.parseInt(params.get("jobId"));
        int userId = Integer.parseInt(params.get("userId"));
        
        Comment c = this.commentService.addComment(content, jobId, userId);
        
        return new ResponseEntity<>(c, HttpStatus.CREATED);
        
        
      }catch(Exception ex){
          ex.printStackTrace();
      }
      return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
}
