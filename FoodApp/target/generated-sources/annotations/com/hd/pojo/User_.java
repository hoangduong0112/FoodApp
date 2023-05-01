package com.hd.pojo;

import com.hd.pojo.OrderSale;
import com.hd.pojo.Store;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-01T21:56:58")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, Date> lastLogin;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SetAttribute<User, Store> storeSet;
    public static volatile SingularAttribute<User, Boolean> active;
    public static volatile SingularAttribute<User, String> avatar;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> hoten;
    public static volatile SingularAttribute<User, String> userRole;
    public static volatile SetAttribute<User, OrderSale> orderSaleSet;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, String> username;

}