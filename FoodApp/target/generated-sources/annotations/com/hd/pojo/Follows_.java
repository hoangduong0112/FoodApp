package com.hd.pojo;

import com.hd.pojo.Store;
import com.hd.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-04T02:28:11")
@StaticMetamodel(Follows.class)
public class Follows_ { 

    public static volatile SingularAttribute<Follows, Integer> id;
    public static volatile SingularAttribute<Follows, Store> storeId;
    public static volatile SingularAttribute<Follows, User> userId;

}