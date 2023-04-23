/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Menu;
import com.hd.pojo.MenuItems;
import com.hd.pojo.Store;
import com.hd.service.MenuItemsService;
import com.hd.service.MenuService;
import com.hd.service.StoreService;
import com.hd.service.UserService;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(path={"/my-store" , "/"})
    public String stores(Model model, Principal p) {
        Store s = this.storeService.getStoreByUserId(this.userService.getUserByUsername(p.getName()).getId());
        model.addAttribute("myStore", s);
        List<Menu> menus = this.menuService.getMenuByStoreId(s.getId());
        List<List<MenuItems>> menuItemsList = new ArrayList<>();
        for (Menu menu : menus) {
            menuItemsList.add(new ArrayList<>(this.menuItemsService.getMenuItemsByMenuId(menu.getId())));
        }
        model.addAttribute("menu", new Menu());
        model.addAttribute("menus", menus);
        model.addAttribute("menuItems", menuItemsList);
        return "my-store";
    }
    
    
    
}
