/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.service;

import com.hd.pojo.Menu;
import java.util.List;

/**
 *
 * @author Duong Hoang
 */
public interface MenuService {
    List<Menu> getMenuByStoreId(int id);
}
