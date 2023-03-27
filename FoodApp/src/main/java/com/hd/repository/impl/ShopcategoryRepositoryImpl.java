/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.Shopcategory;
import com.hd.repository.ShopcategoryRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Duong Hoang
 */
@Repository
@Transactional
public class ShopcategoryRepositoryImpl implements ShopcategoryRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    @Override
    public List<Shopcategory> getShopcategories() {
        Session s = factory.getObject().getCurrentSession();
        Query q = s.createQuery("From Shopcategory");
        return q.getResultList();
    }
    
}
