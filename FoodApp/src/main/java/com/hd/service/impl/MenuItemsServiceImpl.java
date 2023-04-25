/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.pojo.MenuItems;
import com.hd.repository.MenuItemsRepository;
import com.hd.service.MenuItemsService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author nhoxd
 */
@Service
public class MenuItemsServiceImpl implements MenuItemsService{
    
    @Autowired
    private MenuItemsRepository menuItemsRepository;
    @Override
    public List<MenuItems> getMenuItemsByMenuId(int id) {
        return this.menuItemsRepository.getMenuItemsByMenuId(id);
    }

    @Override
    public MenuItems getItem(int id) {
        return this.menuItemsRepository.getItem(id);
    }

    @Override
    public boolean deleteItem(int id) {
        return this.menuItemsRepository.deleteItem(id);
    }

    @Override
    public boolean addOrUpdate(MenuItems item) {
        return this.menuItemsRepository.addOrUpdate(item);
    }
    
}
