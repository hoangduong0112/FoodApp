/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.repository;

import com.hd.pojo.OrderItems;
import java.util.List;

/**
 *
 * @author Duong Hoang
 */
public interface OrderItemRepository {
    List<OrderItems> getOrderItemsByOrderId(int orderId);
    List<OrderItems> getOrderItemsByStoreId(int storeId, String status);
    OrderItems getOrderById(int id);
    Boolean acceptStatus(int id);
}
