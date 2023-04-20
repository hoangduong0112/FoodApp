/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Store;
import com.hd.service.MenuItemsService;
import com.hd.service.MenuService;
import com.hd.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Duong Hoang
 */
@Controller
@RequestMapping("/partner")
public class PartnerController {
    @Autowired
    private StoreService storeService;
    @Autowired
    private MenuService menuService;
    
    @Autowired
    private MenuItemsService menuItemsService;
    @RequestMapping(path={"/my-store" , "/"})
    public String stores(Model model) {
        model.addAttribute("store", this.storeService.getStoreByUserId(7));
        model.addAttribute("menus", this.menuService.getMenuByStoreId(6));
        return "my-store";
    }
    
}
