/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.formatter;

import com.hd.pojo.Menu;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author Duong Hoang
 */
public class MenuFormatter implements Formatter<Menu> {

    @Override
    public String print(Menu t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Menu parse(String id, Locale locale) throws ParseException {
        Menu u = new Menu();
        u.setId(Integer.parseInt(id));
        return u;
    }

}
