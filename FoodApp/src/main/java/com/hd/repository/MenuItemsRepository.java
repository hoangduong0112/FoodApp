/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.repository;

import com.hd.pojo.MenuItems;
import java.util.List;

/**
 *
 * @author nhoxd
 */
public interface MenuItemsRepository {
    List<MenuItems> getMenuItemsByMenuId(int id);
    
    MenuItems getItem(int id);
    boolean deleteItem(int id);
    boolean addOrUpdate(MenuItems m);
}
