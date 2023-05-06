/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.repository;

import com.hd.pojo.Comments;
import java.util.List;

/**
 *
 * @author Duong Hoang
 */
public interface CommentsRepository {
    List<Comments> getListCommentsofStore(int store);
    Boolean addComment(Comments c);
}
