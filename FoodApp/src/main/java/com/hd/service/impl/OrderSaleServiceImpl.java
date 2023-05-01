/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.pojo.Cart;
import com.hd.pojo.OrderSale;
import com.hd.repository.OrderSaleRepository;
import com.hd.service.OrderSaleService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class OrderSaleServiceImpl implements OrderSaleService {

    @Autowired
    private OrderSaleRepository orderSaleRepository;

    @Override
    public int addOrderSale(Map<String, Cart> cart) {
        if(cart != null)
            return this.orderSaleRepository.addOrderSale(cart);
        else
            return -1;
    }

    @Override
    public OrderSale getOrderById(int i) {
        return this.orderSaleRepository.getOrderById(i);
    }
    

}
