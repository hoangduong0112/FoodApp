package com.hd.pojo;

import com.hd.pojo.CuahangOwner;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-03-22T17:50:42")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, String> sdt;
    public static volatile SetAttribute<User, CuahangOwner> cuahangOwnerSet;
    public static volatile SingularAttribute<User, String> role;
    public static volatile SingularAttribute<User, String> ho;
    public static volatile SingularAttribute<User, String> active;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> avatar;
    public static volatile SingularAttribute<User, String> ten;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, String> username;

}