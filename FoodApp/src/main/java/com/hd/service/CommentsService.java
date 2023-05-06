/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.service;

import com.hd.pojo.Comments;
import java.util.List;

/**
 *
 * @author Duong Hoang
 */
public interface CommentsService {

    List<Comments> getListCommentsofStore(int store);

    Boolean addComment(Comments c);
}
