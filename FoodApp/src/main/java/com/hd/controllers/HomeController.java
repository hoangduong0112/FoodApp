/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Cart;
import com.hd.pojo.Category;
import com.hd.pojo.Menu;
import com.hd.pojo.MenuItems;
import com.hd.pojo.Store;
import com.hd.pojo.User;
import com.hd.service.CategoryService;
import com.hd.service.MenuItemsService;
import com.hd.service.MenuService;
import com.hd.service.OrderItemService;
import com.hd.service.OrderSaleService;
import com.hd.service.SecurityService;
import com.hd.service.StoreService;
import com.hd.service.UserService;
import com.hd.utils.Utils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Duong Hoang
 */
@Controller
@ControllerAdvice
public class HomeController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private MenuItemsService menuItemsService;
    @Autowired
    private UserService userService;

    @Autowired
    private OrderSaleService orderSaleService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private SecurityService securityService;

    @ModelAttribute
    public void commonAttribute(Model model, HttpSession session) {
        List<Category> p = this.categoryService.getCategories();
        model.addAttribute("categories", p);
        model.addAttribute("cartStats", Utils.cartStats((Map<Integer, Cart>) session.getAttribute("cart")));
    }

    @RequestMapping(path = {"/", "/store"})
    public String index(Model model, @RequestParam Map<String, String> params) {
        List<Store> s = this.storeService.getStores(params);

        model.addAttribute("stores", s);
        return "index";
    }

    @RequestMapping(path = "/store/{storeId}")
    public String details(Model model, @PathVariable(value = "storeId") int id) {
        model.addAttribute("store", this.storeService.getStoreById(id));

        List<Menu> menus = this.menuService.getMenuByStoreId(id);
        List<List<MenuItems>> menuItemsList = new ArrayList<>();
        for (Menu menu : menus) {
            menuItemsList.add(new ArrayList<>(this.menuItemsService.getMenuItemsByMenuId(menu.getId())));
        }
        model.addAttribute("menus", menus);
        model.addAttribute("menuItemsList", menuItemsList);
        return "store-menu";
    }

    @RequestMapping(path = "/login")
    public String loginView() {
        return "login";
    }

    @GetMapping("/register")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String register(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult rs) {
//        Error in validator
        if (rs.hasErrors()) {
            return "register";
        }
        String errorMessage = "";
        if (user.getPassword().equals(user.getConfirmPassword())) {
            if (this.userService.saveUser(user) == true) {
                securityService.autologin(user.getUsername(), user.getConfirmPassword());
                return "redirect:/";
            } else {
                errorMessage = "Đã có lỗi xảy ra!";
            }
        } else {
            errorMessage = "Mật khẩu không khớp!";
        }

        model.addAttribute("errMsg", errorMessage);
        return "register";
    }

    @GetMapping(path = "/cart")
    public String cart(Model model, HttpSession session) {

        model.addAttribute("carts", (Map<Integer, Cart>) session.getAttribute("cart"));
        return "cart";
    }

    @GetMapping(path = "/checkout/{id}")
    public String checkout(@PathVariable(value = "id") int id, Model model) {
        model.addAttribute("orderSale", this.orderSaleService.getOrderById(id));
        model.addAttribute("items", this.orderItemService.getOrderItemsByOrderId(id));
        return "checkout";
    }
}
