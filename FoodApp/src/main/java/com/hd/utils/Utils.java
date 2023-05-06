/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.utils;

import com.hd.pojo.Cart;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Duong Hoang
 */
public class Utils {

    public static Map<String, String> cartStats(Map<Integer, Cart> cart) {
        int totalQuantity = 0;
        Long totalAmount = 0l;

        if(cart != null){
            for( Cart c: cart.values()){
                totalQuantity += c.getQuantity();
                totalAmount += c.getQuantity() * c.getPrice();
            }
        }
        HashMap<String, String> re = new HashMap<>();
        re.put("totalQuantity", String.valueOf(totalQuantity));
        re.put("totalAmount", String.valueOf(totalAmount));
        return re;
    }
}
