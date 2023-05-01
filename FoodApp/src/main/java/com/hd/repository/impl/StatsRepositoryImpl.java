/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.Category;
import com.hd.pojo.Menu;
import com.hd.pojo.MenuItems;
import com.hd.pojo.OrderItems;
import com.hd.pojo.OrderSale;
import com.hd.pojo.Store;
import com.hd.repository.StatsRepository;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.Join;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Duong Hoang
 */
@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    //Completed Doanh thu theo menu và thời gian
    @Override
    public List<Object[]> getSalesStatsByMenuAndYear(int storeId, Date fromDate, Date toDate) {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootMenu = q.from(Menu.class);
        Root rootIM = q.from(MenuItems.class);
        Root rootI = q.from(OrderItems.class);
        Root rootO = q.from(OrderSale.class);

        List<Predicate> predicates = new ArrayList<>();

        predicates.add(b.equal(rootMenu.get("storeId"), storeId));
        predicates.add(b.equal(rootIM.get("menuId"), rootMenu.get("id")));
        predicates.add(b.equal(rootI.get("itemId"), rootIM.get("id")));
        predicates.add(b.equal(rootI.get("orderId"), rootO.get("id")));

        q.multiselect(rootMenu.get("id"), rootMenu.get("name"),
                b.sum(b.prod(rootI.get("quantity"), rootIM.get("price"))));

        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rootO.get("createdDate").as(Date.class), fromDate));
        }

        if (toDate != null) {
            predicates.add(b.lessThanOrEqualTo(rootO.get("createdDate").as(Date.class), toDate));
        }

        Predicate[] predicateArray = new Predicate[predicates.size()];
        predicateArray = predicates.toArray(predicateArray);
        q.where(predicateArray);

        q.groupBy(rootMenu.get("id"));
        q.orderBy(b.desc(rootMenu.get("id")));

        Query query = session.createQuery(q);
        return query.getResultList();

    }

    @Override
    public List<Object[]> getSalesStatsByItemsAndYear(int menuId, Date fromDate, Date toDate) {

        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootIM = q.from(MenuItems.class);
        Root rootI = q.from(OrderItems.class);
        Root rootO = q.from(OrderSale.class);

        List<Predicate> predicates = new ArrayList<>();

        predicates.add(b.equal(rootIM.get("menuId"), menuId));
        predicates.add(b.equal(rootI.get("itemId"), rootIM.get("id")));
        predicates.add(b.equal(rootI.get("orderId"), rootO.get("id")));

        q.multiselect(rootIM.get("id"), rootIM.get("name"),
                b.sum(b.prod(rootI.get("quantity"), rootIM.get("price"))));

        if (fromDate != null) {
            predicates.add(b.greaterThanOrEqualTo(rootO.get("createdDate").as(Date.class), fromDate));
        }

        if (toDate != null) {
            predicates.add(b.lessThanOrEqualTo(rootO.get("createdDate").as(Date.class), toDate));
        }

        //error source-7 arrow function
        Predicate[] predicateArray = new Predicate[predicates.size()];
        predicateArray = predicates.toArray(predicateArray);
        q.where(predicateArray);

        q.groupBy(rootIM.get("id"));
        q.orderBy(b.desc(rootIM.get("id")));

        Query query = session.createQuery(q);
        return query.getResultList();

    }

    @Override
    public List<Object[]> statsStore() {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootStore = q.from(Store.class);
        Root rootMenu = q.from(Menu.class);
        Root rootMenuItems = q.from(MenuItems.class);

        List<Predicate> predicates = new ArrayList<>();

        predicates.add(b.equal(rootMenu.get("storeId"), rootStore.get("id")));
        predicates.add(b.equal(rootMenuItems.get("menuId"), rootMenu.get("id")));

        Predicate[] predicateArray = new Predicate[predicates.size()];
        predicateArray = predicates.toArray(predicateArray);
        q.where(predicateArray);
        q.multiselect(rootStore.get("id"), rootStore.get("name"), b.count(rootMenuItems.get("id")));

        q.groupBy(rootStore.get("id"));
        q.orderBy(b.desc(rootStore.get("id")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public List<Object[]> statsRevenueStore() {
        Session session = this.factory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> q = b.createQuery(Object[].class);

        Root rootStore = q.from(Store.class);
        Root rootMenu = q.from(Menu.class);
        Root rootMenuItems = q.from(MenuItems.class);
        Root rootOrderItem = q.from(OrderItems.class);
        Root rootOrder = q.from(OrderSale.class);

        List<Predicate> predicates = new ArrayList<>();

        predicates.add(b.equal(rootMenu.get("storeId"), rootStore.get("id")));
        predicates.add(b.equal(rootMenuItems.get("menuId"), rootMenu.get("id")));
        predicates.add(b.equal(rootOrderItem.get("itemId"), rootMenuItems.get("id")));
        predicates.add(b.equal(rootOrderItem.get("orderId"), rootOrder.get("id")));

        Predicate[] predicateArray = new Predicate[predicates.size()];
        predicateArray = predicates.toArray(predicateArray);
        q.where(predicateArray);
        
        q.multiselect(rootStore.get("id"), rootStore.get("name"),
                b.sum(b.prod(rootOrderItem.get("quantity"), rootMenuItems.get("price"))));
        q.groupBy(rootStore.get("id"));
        q.orderBy(b.desc(rootStore.get("id")));

        Query query = session.createQuery(q);
        return query.getResultList();
    }

}
