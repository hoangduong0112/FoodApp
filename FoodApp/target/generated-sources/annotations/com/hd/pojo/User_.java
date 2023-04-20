package com.hd.pojo;

import com.hd.pojo.Store;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-04-20T03:44:27")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, Date> lastLogin;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SetAttribute<User, Store> storeSet;
    public static volatile SingularAttribute<User, Boolean> active;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> hoten;
    public static volatile SingularAttribute<User, String> avatar;
    public static volatile SingularAttribute<User, String> userRole;
    public static volatile SingularAttribute<User, String> username;

}