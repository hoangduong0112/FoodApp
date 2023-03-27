/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.pojo.Shopcategory;
import com.hd.repository.ShopcategoryRepository;
import com.hd.service.ShopcategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class ShopcategoryServiceImpl implements ShopcategoryService{

    @Autowired
    private ShopcategoryRepository shopcategoryRepository;
    @Override
    public List<Shopcategory> getShopcategories() {
        return this.shopcategoryRepository.getShopcategories();
    }
    
}
