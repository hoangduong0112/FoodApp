/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.OrderItems;
import com.hd.repository.OrderItemRepository;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
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
public class OrderItemRepositoryImpl implements OrderItemRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<OrderItems> getOrderItemsByOrderId(int orderId) {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder cb = s.getCriteriaBuilder();
        CriteriaQuery<OrderItems> cq = cb.createQuery(OrderItems.class);
        Root<OrderItems> root = cq.from(OrderItems.class);
        cq.where(cb.equal(root.get("orderId"), orderId));
        return s.createQuery(cq).getResultList();
    }

}
