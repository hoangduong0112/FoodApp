package com.hd.pojo;

import com.hd.pojo.Shopcategory;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-03-27T20:40:23")
@StaticMetamodel(Shop.class)
public class Shop_ { 

    public static volatile SingularAttribute<Shop, Short> isOpen;
    public static volatile SingularAttribute<Shop, String> address;
    public static volatile SingularAttribute<Shop, Integer> reviewpoint;
    public static volatile SingularAttribute<Shop, String> name;
    public static volatile SingularAttribute<Shop, Integer> id;
    public static volatile SingularAttribute<Shop, Shopcategory> categoryId;

}