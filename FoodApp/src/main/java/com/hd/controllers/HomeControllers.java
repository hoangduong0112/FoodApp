/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Shopcategory;
import com.hd.service.ShopcategoryService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Duong Hoang
 */
@Controller
public class HomeControllers {
    @Autowired
    private ShopcategoryService shopcategoryService;
    @RequestMapping("/")
    public String index(Model model){
        List<Shopcategory> p = this.shopcategoryService.getShopcategories();
        
        model.addAttribute("phanloai", p);
        return "index";
    }
}
