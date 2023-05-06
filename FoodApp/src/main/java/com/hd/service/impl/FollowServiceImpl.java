/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.pojo.Follows;
import com.hd.pojo.Store;
import com.hd.pojo.User;
import com.hd.repository.FollowRepository;
import com.hd.service.FollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class FollowServiceImpl implements FollowService{
    @Autowired
    private FollowRepository followRepo;

    @Override
    public Boolean followStore(Follows follow) {
        return this.followRepo.followStore(follow);
    }

    @Override
    public Boolean unfollowStore(Follows follow) {
        return this.followRepo.unfollowStore(follow);
    }

    @Override
    public Boolean isFollowing(User user, Store store) {
        return this.followRepo.isFollowing(user, store);
    }
}
