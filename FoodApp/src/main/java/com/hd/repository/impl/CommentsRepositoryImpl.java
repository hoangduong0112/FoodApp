/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.Comments;
import com.hd.repository.CommentsRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.HibernateException;
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
public class CommentsRepositoryImpl implements CommentsRepository{

    @Autowired
    private LocalSessionFactoryBean factory;
    @Override
    public List<Comments> getListCommentsofStore(int store) {
       Session s = this.factory.getObject().getCurrentSession();
       Query q = s.createQuery("From Comments Where storeId.id=:store");   
       q.setParameter("store", store);
       
       return q.getResultList();
       
    }

    @Override
    public Boolean addComment(Comments c) {
        Session s = this.factory.getObject().getCurrentSession();
        try{
            s.save(c);
            return true;
        }catch(HibernateException ex){
            ex.printStackTrace();
            return false;
        }
    }
    
}
