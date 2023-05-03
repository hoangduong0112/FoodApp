/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.ItemsOrderStatus;
import com.hd.pojo.Menu;
import com.hd.pojo.MenuItems;
import com.hd.pojo.OrderItems;
import com.hd.repository.OrderItemRepository;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
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

    @Override
    public List<OrderItems> getOrderItemsByStoreId(int storeId, String status) {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder cb = s.getCriteriaBuilder();
        CriteriaQuery<OrderItems> cq = cb.createQuery(OrderItems.class);

        Root rootMenu = cq.from(Menu.class);
        Root rootIM = cq.from(MenuItems.class);
        Root rootI = cq.from(OrderItems.class);

        List<Predicate> predicates = new ArrayList<>();

        predicates.add(cb.equal(rootMenu.get("storeId"), storeId));
        predicates.add(cb.equal(rootIM.get("menuId"), rootMenu.get("id")));
        predicates.add(cb.equal(rootI.get("itemId"), rootIM.get("id")));

        if (status != null && !status.isEmpty()) {
            predicates.add(cb.equal(rootI.get("status"), status));
        }

        cq.select(rootI);
        cq.where(predicates.toArray(new Predicate[]{}));
        cq.orderBy(cb.desc(rootI.get("orderId").get("createdDate")));
        Query query = s.createQuery(cq);
        return query.getResultList();
    }

    @Override
    public OrderItems getOrderById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(OrderItems.class, id);
    }

    @Override
    public Boolean acceptStatus(int i) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            OrderItems item = this.getOrderById(i);
            item.setStatus(String.valueOf(ItemsOrderStatus.ACCEPT));
            s.save(item);
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            return false;
        }
    }

}
