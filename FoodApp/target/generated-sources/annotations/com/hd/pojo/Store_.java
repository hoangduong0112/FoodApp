package com.hd.pojo;

import com.hd.pojo.Category;
import com.hd.pojo.Menu;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-04-18T02:31:03")
@StaticMetamodel(Store.class)
public class Store_ { 

    public static volatile SingularAttribute<Store, String> image;
    public static volatile SingularAttribute<Store, String> sdt;
    public static volatile SingularAttribute<Store, String> address;
    public static volatile SetAttribute<Store, Menu> menuSet;
    public static volatile SingularAttribute<Store, String> name;
    public static volatile SingularAttribute<Store, Integer> id;
    public static volatile SingularAttribute<Store, Category> categoryId;

}