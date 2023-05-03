/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Duong Hoang
 */
@RestController
@RequestMapping("/api/orderItems")
public class ApiOrderItemsController {

    @Autowired
    private OrderItemService orderItemService;

    @PutMapping("/accept/{id}")
    public ResponseEntity<String> updateOrderItemStatus(@PathVariable("id") int id) {
        boolean success = orderItemService.acceptStatus(id);
        if (success) {
            return ResponseEntity.ok("Order item status updated successfully.");
        } else {
            return ResponseEntity.badRequest().body("Failed to update order item status.");
        }
    }
}
