/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.repository.impl;

import com.hd.pojo.Cart;
import com.hd.pojo.ItemsOrderStatus;
import com.hd.pojo.OrderItems;
import com.hd.pojo.OrderSale;
import com.hd.repository.MenuItemsRepository;
import com.hd.repository.OrderSaleRepository;
import com.hd.repository.UserRepository;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Duong Hoang
 */
@Repository
@Transactional
public class OrderSaleRepositoryImpl implements OrderSaleRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Autowired
    private MenuItemsRepository itemRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int addOrderSale(Map<String, Cart> cart) {
        Session s = factory.getObject().getCurrentSession();
        try {
            OrderSale sale = new OrderSale();
            sale.setCreatedDate(new Date());
            sale.setUserId(this.userRepository.getUserByUsername(SecurityContextHolder.getContext().getAuthentication().getName()));


            for (Cart c : cart.values()) {
                OrderItems d = new OrderItems();
                d.setQuantity(c.getQuantity());
                d.setOrderId(sale);
                d.setItemId(this.itemRepository.getItem(c.getId()));
                d.setStatus(String.valueOf(ItemsOrderStatus.WAITING));
                s.save(d);

            }

            s.save(sale);
            return sale.getId();
        } catch (HibernateException ex) {
            return -1; 
        }
    }

    @Override
    public OrderSale getOrderById(int id) {
        Session s = factory.getObject().getCurrentSession();
        return s.get(OrderSale.class, id);
    }

}
