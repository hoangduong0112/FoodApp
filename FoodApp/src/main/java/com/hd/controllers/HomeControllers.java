/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;


import com.hd.pojo.Category;
import com.hd.pojo.Store;
import com.hd.service.CategoryService;
import com.hd.service.StoreService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Duong Hoang
 */
@Controller
public class HomeControllers {
    @Autowired
    private CategoryService categoryService;
            
    @Autowired
    private StoreService storeService;
    @RequestMapping(path ={"/", "/store"})
    public String index(Model model, @RequestParam Map<String, String> params){
        List<Category> p = this.categoryService.getCategories();
        List<Store> s = this.storeService.getStores(params);
        model.addAttribute("phanloai", p);
        model.addAttribute("stores", s);
        return "index";
    }
    
    @RequestMapping(path = "/store/{storeId}")
    public String details(Model model, @PathVariable(value = "storeId") int id){
        model.addAttribute("store", this.storeService.getStoreById(id));
        return "store-menu";
    }
}
