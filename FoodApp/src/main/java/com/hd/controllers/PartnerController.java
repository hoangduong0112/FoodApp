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
import com.hd.service.StatsService;
import com.hd.service.StoreService;
import com.hd.service.UserService;
import java.security.Principal;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @Autowired
    private StatsService statsService;

    @ModelAttribute
    public void commonAttribute(Model model, Principal p) {
        Store s = this.storeService.getStoreByUserId(this.userService.getUserByUsername(p.getName()).getId());
        model.addAttribute("myStore", s);
        List<Menu> menus = this.menuService.getMenuByStoreId(s.getId());
        List<List<MenuItems>> menuItemsList = new ArrayList<>();
        for (Menu menu : menus) {
            menuItemsList.add(new ArrayList<>(this.menuItemsService.getMenuItemsByMenuId(menu.getId())));
        }
        model.addAttribute("menus", menus);
        model.addAttribute("menuItems", menuItemsList);
    }

    @GetMapping(path = {"/my-store", "/"})
    public String myStore(Model model, Principal p) {
        model.addAttribute("menu", new Menu());
        model.addAttribute("item", new MenuItems());
        return "my-store";
    }

    @RequestMapping("/my-store")
    public String addMenu(Model model, @ModelAttribute(value = "menu") Menu m, Principal p) {
        Store s = this.storeService.getStoreByUserId(this.userService.getUserByUsername(p.getName()).getId());
        m.setStoreId(s);
        if (this.menuService.addOrUpdate(m) == true) {
            return "redirect:/partner/my-store";
        } else {
            model.addAttribute("errMsg", "Something wrong!");
        }

        return "my-store";
    }

    @RequestMapping("/my-store/{menuId}")
    public String UpdateMenu(Model model, @ModelAttribute(value = "menu") Menu m, @PathVariable(value = "menuId") int id, Principal p) {
        Store s = this.storeService.getStoreByUserId(this.userService.getUserByUsername(p.getName()).getId());
        m.setStoreId(s);
        m.setId(id);
        if (this.menuService.addOrUpdate(m) == true) {
            return "redirect:/partner/my-store";
        } else {
            model.addAttribute("errMsg", "Something wrong!");
        }

        return "my-store";
    }

    @RequestMapping("/my-store/item")
    public String addItem(Model model, @ModelAttribute(name = "item") MenuItems item) {
//        Menu menu = this.menuService.getMenuById(id);
//        item.setMenuId(menu);
        if (this.menuItemsService.addOrUpdate(item) == true) {
            return "redirect:/partner/my-store";
        } else {
            model.addAttribute("errMsg", "Something wrong!");
        }

        return "my-store";
    }

    @RequestMapping("/my-store/item/{itemId}")
    public String UpdateItem(Model model, @ModelAttribute(value = "item") MenuItems item, @PathVariable(value = "itemId") int id) {
        item.setId(id);
        if (this.menuItemsService.addOrUpdate(item) == true) {
            return "redirect:/partner/my-store";
        } else {
            model.addAttribute("errMsg", "Something wrong!");
        }

        return "my-store";
    }

    @GetMapping("/my-store/edit")
    public String editStoreForm(Model model, Principal p) {
        return "edit-store";
    }

    @RequestMapping("/my-store/edit/{storeId}")
    public String editStore(Model model, @ModelAttribute(value = "myStore") Store s, @PathVariable(value = "storeId") int id, Principal p) {
        s.setUserId(this.userService.getUserByUsername(p.getName()));
        if (this.storeService.addOrUpdate(s) == true) {
            return "redirect:/partner/my-store";
        }
        return "my-store";
    }


    @RequestMapping("/stats")
    public String stats(Model model, Principal p, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(value = "fromDate", required = false) Date fromDate, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(value = "toDate", required = false) Date toDate) {
        Store s = this.storeService.getStoreByUserId(this.userService.getUserByUsername(p.getName()).getId());
        //    @DateTimeFormat(pattern = "")
        model.addAttribute("revenues", this.statsService.getSalesStatsByMenuAndYear(s.getId(), fromDate, toDate));
        return "chartOverall";
    }
    
    @RequestMapping("/stats/{menuId}")
    public String stats(Model model, @PathVariable(value = "menuId") int id, Principal p, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(value = "fromDate", required = false) Date fromDate, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) @RequestParam(value = "toDate", required = false) Date toDate) {
        model.addAttribute("menuId", id);
        model.addAttribute("revenues", this.statsService.getSalesStatsByItemsAndYear(id, fromDate, toDate));
        return "chartMenu";
    }

}
