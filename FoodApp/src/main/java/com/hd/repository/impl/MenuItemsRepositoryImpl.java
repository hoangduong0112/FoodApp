/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.MenuItems;
import com.hd.repository.MenuItemsRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author nhoxd
 */
@Repository
@Transactional
public class MenuItemsRepositoryImpl implements MenuItemsRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<MenuItems> getMenuItemsByMenuId(int id) {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<MenuItems> q = b.createQuery(MenuItems.class);
        Root root = q.from(MenuItems.class);
        q.select(root).where(b.equal(root.get("menuId"), id));
        Query query = s.createQuery(q);
        List<MenuItems> items = query.getResultList();
        return items;

    }

    @Override
    public MenuItems getItem(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(MenuItems.class, id);
    }

    @Override
    public boolean deleteItem(int id) {
        MenuItems item = this.getItem(id);
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.delete(item);
            return true;
        } catch (HibernateException ex) {
            return false;
        }

    }

}
