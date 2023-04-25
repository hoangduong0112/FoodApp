/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Store;
import com.hd.service.StoreService;
import com.hd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Duong Hoang
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private StoreService storeService;

    @Autowired
    private UserService userService;

    @ModelAttribute
    public void commonAttribute(Model model) {
        model.addAttribute("stores", this.storeService.getStores(null));
        model.addAttribute("users", this.userService.getUsers());
    }

    @RequestMapping("/stores")
    public String addOrUpdateStore(Model model, @ModelAttribute(value = "store") Store s) {
        if (this.storeService.getStoreByUserId(s.getUserId().getId()) != null) {
            model.addAttribute("errMsg", "User hiện đã quản trị 1 cửa hàng");
            return "stores";
        } else if (this.storeService.addOrUpdate(s) == true) {
                return "redirect:/admin/stores";
            }
        else {
            model.addAttribute("errMsg", "Something wrong!");
        }

        return "stores";
    }

    @GetMapping("/stores")
    public String stores(Model model) {
        return "stores";
    }

    @GetMapping("/stores/add")
    public String addStore(Model model) {
        model.addAttribute("store", new Store());
        return "store-form";
    }

    @GetMapping("/stores/{storeId}")
    public String updateStore(Model model, @PathVariable(value = "storeId") int id) {
        model.addAttribute("store", this.storeService.getStoreById(id));
        return "store-form";
    }

}
