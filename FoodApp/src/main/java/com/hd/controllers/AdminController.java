/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Store;
import com.hd.service.StoreService;
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

    @ModelAttribute
    public void commonAttribute(Model model) {
        model.addAttribute("stores", this.storeService.getStores(null));

    }

    @RequestMapping("/stores")
    public String addStore(Model model, @ModelAttribute(value = "store") Store s) {
        if (this.storeService.addOrUpdate(s) == true) {
            return "redirect:/admin/stores";
        } else {
            model.addAttribute("errMsg", "Something wrong!");
        }

        return "stores";
    }

    @GetMapping("/stores")
    public String stores(Model model) {
        model.addAttribute("store", new Store());
        return "stores";
    }

    @GetMapping("/stores/{storeId}")
    public String updateStore(Model model, @PathVariable(value = "storeId") int id) {
        model.addAttribute("store", this.storeService.getStoreById(id));
        return "stores";
    }

}
