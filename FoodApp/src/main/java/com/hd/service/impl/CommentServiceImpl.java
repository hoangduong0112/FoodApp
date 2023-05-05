/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.pojo.Comments;
import com.hd.repository.CommentRepository;
import com.hd.service.CommentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentRepository commentRepository;

    @Override
    public List<Comments> getComments(int storeId) {
        return this.commentRepository.getComments(storeId);
    }

    @Override
    public boolean addComment(Comments c) {
        return this.commentRepository.addComment(c);
    }

}