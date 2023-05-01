/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.repository;

import com.hd.pojo.Cart;
import com.hd.pojo.OrderSale;
import java.util.Map;

/**
 *
 * @author Duong Hoang
 */
public interface OrderSaleRepository {
    int addOrderSale(Map<String, Cart> cart);
    OrderSale getOrderById(int id);
    
}
