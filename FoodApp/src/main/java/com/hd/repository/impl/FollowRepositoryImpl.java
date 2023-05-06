/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.Follows;
import com.hd.pojo.Store;
import com.hd.pojo.User;
import com.hd.repository.FollowRepository;
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
public class FollowRepositoryImpl implements FollowRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public Boolean followStore(Follows follow) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.save(follow);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public Boolean unfollowStore(Follows follow) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            Follows managedFollow = (Follows) s.createQuery("FROM Follows f WHERE f.storeId.id = :storeId AND f.userId.id = :userId")
                    .setParameter("storeId", follow.getStoreId().getId())
                    .setParameter("userId", follow.getUserId().getId())
                    .getSingleResult();

            s.delete(managedFollow);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public Boolean isFollowing(User user, Store store) {
        Session s = this.factory.getObject().getCurrentSession();
        Query query = s.createQuery("SELECT COUNT(f) FROM Follows f WHERE f.userId = :user AND f.storeId = :store")
                .setParameter("user", user)
                .setParameter("store", store);
        Long count = (Long) query.getSingleResult();
        return count > 0;
    }

    @Override
    public List<Follows> getFollowStore(User user) {
        Session s = this.factory.getObject().getCurrentSession();
        String hql = "FROM Follows f WHERE f.userId = :user";
        Query query = s.createQuery(hql);
        query.setParameter("user", user);
        List<Follows> followStores = query.getResultList();
        return followStores;
    }

}
