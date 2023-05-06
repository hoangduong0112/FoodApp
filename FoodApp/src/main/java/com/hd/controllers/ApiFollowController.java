/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Follows;
import com.hd.pojo.Store;
import com.hd.pojo.User;
import com.hd.service.FollowService;
import com.hd.service.StoreService;
import com.hd.service.UserService;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Duong Hoang
 */
@RestController
@RequestMapping("/api")
public class ApiFollowController {

    @Autowired
    private StoreService storeService;

    @Autowired
    private UserService userService;

    @Autowired
    private FollowService followService;

    @PostMapping(path = "/stores/{storeId}/follow", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> followStore(@PathVariable(value = "storeId") int storeId, Principal principal) {
        User user = this.userService.getUserByUsername(principal.getName());
        Store store = this.storeService.getStoreById(storeId);

        if (this.followService.isFollowing(user, store)) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        }

        Follows follow = new Follows();
        follow.setStoreId(store);
        follow.setUserId(user);
        if (this.followService.followStore(follow)) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }
    
     @PostMapping(path = "/stores/{storeId}/unfollow", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> unfollowStore(@PathVariable(value = "storeId") int storeId, Principal principal) {
        
        User user = this.userService.getUserByUsername(principal.getName());
        Store store = this.storeService.getStoreById(storeId);

        if (!this.followService.isFollowing(user, store)) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        }

        Follows follow = new Follows();
        follow.setStoreId(store);
        follow.setUserId(user);
        if (this.followService.unfollowStore(follow)) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }
    }
    
}
