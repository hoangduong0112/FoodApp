/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.pojo.Comments;
import com.hd.repository.CommentsRepository;
import com.hd.service.CommentsService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class CommentsServiceImpl implements CommentsService{

    @Autowired
    private CommentsRepository commentsRepository;
    @Override
    public List<Comments> getListCommentsofStore(int store) {
      return this.commentsRepository.getListCommentsofStore(store);
    }

    @Override
    public Boolean addComment(Comments c) {
        return this.commentsRepository.addComment(c);
    }
    
}
