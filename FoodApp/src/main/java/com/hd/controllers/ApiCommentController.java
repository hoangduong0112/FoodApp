/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Comments;
import com.hd.pojo.Store;
import com.hd.pojo.User;
import com.hd.service.CommentService;
import com.hd.service.StoreService;
import com.hd.service.UserService;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


/**
 *
 * @author Duong Hoang
 */
@RestController
public class ApiCommentController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private UserService userService;

    @GetMapping("/api/stores/{storeId}/comments")
    public ResponseEntity<List<Comments>> getComments(@PathVariable(value = "storeId") int id) {
        List<Comments> comments = this.commentService.getComments(id);

        return new ResponseEntity<>(comments, HttpStatus.OK);
    }

    @PostMapping(value = "/api/stores/{storeId}/comments", produces = {
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comments> addComment(@PathVariable(value = "storeId") int id,
            @RequestBody Map<String, String> params,
            HttpSession session) {
        Comments c = new Comments();
        c.setContent(params.get("content"));
        c.setStoreId(this.storeService.getStoreById(id));
        c.setUserId((User) session.getAttribute("currentUser"));
        c.setCreatedDate(new Date());
        
        if (this.commentService.addComment(c) == true)
            return new ResponseEntity<>(c, HttpStatus.CREATED);
        
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
