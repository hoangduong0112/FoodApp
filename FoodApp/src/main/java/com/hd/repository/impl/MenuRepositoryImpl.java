/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.Menu;
import com.hd.repository.MenuRepository;
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
 * @author Duong Hoang
 */
@Repository
@Transactional
public class MenuRepositoryImpl implements MenuRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Menu> getMenuByStoreId(int id) {
        Session s = factory.getObject().getCurrentSession();
        CriteriaBuilder b = s.getCriteriaBuilder();
        CriteriaQuery<Menu> q = b.createQuery(Menu.class);
        Root root = q.from(Menu.class);
        q.select(root).where(b.equal(root.get("storeId"), id));
        Query query = s.createQuery(q);
        List<Menu> menus = query.getResultList();
        return menus;
    }

    @Override
    public Menu getMenuById(int id) {
        Session s = this.factory.getObject().getCurrentSession();
        return s.get(Menu.class, id);
    }

    @Override
    public boolean deleteMenu(int id) {
        Menu m = this.getMenuById(id);
        
        //Cascade chưa set
        Session s = this.factory.getObject().getCurrentSession();
        try {
            s.delete(m);
            return true;
        } catch (HibernateException ex) {
            return false;
        }
    }

    @Override
    public boolean addOrUpdate(Menu m) {
        Session s = this.factory.getObject().getCurrentSession();
        try {
            if (m.getId() != null) {
                Menu menu = this.getMenuById(m.getId());

                menu.setName(m.getName().trim());

                s.save(menu);
            } else {
                s.save(m);
            }
            return true;
        } catch (HibernateException ex) {
            return false;
        }

    }

}