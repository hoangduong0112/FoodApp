package com.hd.pojo;

import com.hd.pojo.MenuItems;
import com.hd.pojo.Store;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-04-25T14:33:08")
@StaticMetamodel(Menu.class)
public class Menu_ { 

    public static volatile SingularAttribute<Menu, String> name;
    public static volatile SingularAttribute<Menu, Integer> id;
    public static volatile SetAttribute<Menu, MenuItems> menuItemsSet;
    public static volatile SingularAttribute<Menu, Store> storeId;

}