/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.controllers;

import com.hd.pojo.Phanloai;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Duong Hoang
 */
@Controller
public class HomeControllers {
    @RequestMapping("/")
    public String index(Model model){
        List<Phanloai> p = new ArrayList<>();
        p.add(new Phanloai(1, "a"));
        p.add(new Phanloai(1, "a"));
        p.add(new Phanloai(1, "a"));
        model.addAttribute("phanloai", p);
        return "index";
    }
}
