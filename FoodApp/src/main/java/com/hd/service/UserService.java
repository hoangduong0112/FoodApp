/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.service;

import com.hd.pojo.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author Duong Hoang
 */
public interface UserService extends UserDetailsService {

    public User getUserByUsername(String username);

    boolean saveUser(User user);

    List<User> getUsers();

}
