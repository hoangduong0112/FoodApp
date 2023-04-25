/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.pojo.Menu;
import com.hd.repository.MenuRepository;
import com.hd.service.MenuService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuRepository menuRepository;

    @Override
    public List<Menu> getMenuByStoreId(int id) {
        return this.menuRepository.getMenuByStoreId(id);
    }

    @Override
    public Menu getMenuById(int id) {
        return this.menuRepository.getMenuById(id);
    }

    @Override
    public boolean deleteMenu(int id) {
        return this.menuRepository.deleteMenu(id);
    }

    @Override
    public boolean addOrUpdate(Menu menu) {
        return this.menuRepository.addOrUpdate(menu);
    }

    

}
