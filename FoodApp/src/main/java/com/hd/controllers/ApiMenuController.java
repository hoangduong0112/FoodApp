/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Menu;
import com.hd.service.MenuItemsService;
import com.hd.service.MenuService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

/**
 *
 * @author Duong Hoang
 */
@RestController
public class ApiMenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private MenuItemsService itemService;

    @DeleteMapping("/api/deleteMenu/{menuId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteMenu(@PathVariable(value = "menuId") int id) {
        if (this.itemService.getMenuItemsByMenuId(id).isEmpty()) {
            this.menuService.deleteMenu(id);
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Không thể xóa bởi vì trong menu vẫn còn sản phẩm");
        }
    }

}
