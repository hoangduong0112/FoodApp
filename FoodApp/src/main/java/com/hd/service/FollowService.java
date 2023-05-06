/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.service;

import com.hd.pojo.Follows;
import com.hd.pojo.Store;
import com.hd.pojo.User;
import java.util.List;

/**
 *
 * @author Duong Hoang
 */
public interface FollowService {

    Boolean followStore(Follows follow);

    Boolean unfollowStore(Follows follow);
    
    Boolean isFollowing(User user, Store store);
    
    List<Follows> getFollowStore(User user);
}
