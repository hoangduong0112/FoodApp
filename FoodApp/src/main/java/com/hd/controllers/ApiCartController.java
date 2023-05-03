/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Cart;
import com.hd.service.MenuItemsService;
import com.hd.service.OrderSaleService;
import com.hd.handler.MailHandler;
import com.hd.utils.Utils;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Duong Hoang
 */
@RestController
@RequestMapping("/api")
public class ApiCartController {

    @Autowired
    private MenuItemsService itemService;
    @Autowired
    private OrderSaleService orderSaleService;


    @Autowired
    private MailHandler mailHandler;
    @PostMapping(value = "/cart")
    public ResponseEntity<Map<String, String>> addToCart(@RequestBody Cart c, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        if (cart.containsKey(c.getId()) == true) {
            Cart t = cart.get(c.getId());
            t.setQuantity(t.getQuantity() + 1);
        } else {
            cart.put(c.getId(), c);
        }

        session.setAttribute("cart", cart);

        return new ResponseEntity<>(Utils.cartStats(cart), HttpStatus.OK);
    }

    @PutMapping(path = "/cart/{itemId}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, String>> updateItemCart(@PathVariable(value = "itemId") int id,
            @RequestBody Map<String, Integer> params, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(id)) {
            Cart c = cart.get(id);
            c.setQuantity(params.get("quantity"));
        }

        session.setAttribute("cart", cart);

        return new ResponseEntity<>(Utils.cartStats(cart), HttpStatus.OK);
    }

    @DeleteMapping(path = "/cart/{itemId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, String>> deleteItemCart(@PathVariable(value = "itemId") int id, HttpSession session) {
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(id)) {
            cart.remove(id);
        }

        session.setAttribute("cart", cart);

        return new ResponseEntity<>(Utils.cartStats(cart), HttpStatus.OK);
    }

    @PostMapping("/pay")
    public ResponseEntity<String> pay(HttpSession session) throws MessagingException {
        int orderId = this.orderSaleService.addOrderSale((Map<String, Cart>) session.getAttribute("cart"));
        if (orderId > 0) {
            session.removeAttribute("cart");
            if (this.mailHandler.sendOrderConfirmation(orderId)) {
                String url = "/FoodApp/checkout/" + orderId;
                return ResponseEntity.ok(url);
            }
            String url = "/FoodApp/checkout/" + orderId;
            return ResponseEntity.ok(url);

        }

        return ResponseEntity.badRequest().build();
    }
}
