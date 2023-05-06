package com.hd.pojo;

import com.hd.pojo.Menu;
import com.hd.pojo.OrderItems;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-06T15:50:30")
@StaticMetamodel(MenuItems.class)
public class MenuItems_ { 

    public static volatile SingularAttribute<MenuItems, Long> price;
    public static volatile SingularAttribute<MenuItems, String> name;
    public static volatile SingularAttribute<MenuItems, Menu> menuId;
    public static volatile SingularAttribute<MenuItems, Integer> id;
    public static volatile SetAttribute<MenuItems, OrderItems> orderItemsSet;

}