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
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Duong Hoang
 */
@RestController
public class ApiStoreController {

    @Autowired
    private StoreService storeService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private MenuItemsService itemService;

    @DeleteMapping("/api/deleteStore/{storeId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteStore(@PathVariable(value = "storeId") int id) {

        List<Menu> menus = this.menuService.getMenuByStoreId(id);
        for (Menu menu : menus) {
            List<MenuItems> items = this.itemService.getMenuItemsByMenuId(menu.getId());
            for (MenuItems item : items) {
                itemService.deleteItem(item.getId());
            }
            menuService.deleteMenu(menu.getId());
        }

        // Delete the Store
        this.storeService.deteleStore(id);
    }
}
