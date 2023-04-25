/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.repository;

import com.hd.pojo.Menu;
import java.util.List;

/**
 *
 * @author Duong Hoang
 */
public interface MenuRepository {

    List<Menu> getMenuByStoreId(int id);

    Menu getMenuById(int id);
    boolean deleteMenu(int id);
    boolean addOrUpdate(Menu m);
}
