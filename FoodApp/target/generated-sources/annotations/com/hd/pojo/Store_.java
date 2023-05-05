package com.hd.pojo;

import com.hd.pojo.Category;
import com.hd.pojo.Comments;
import com.hd.pojo.Follows;
import com.hd.pojo.Menu;
import com.hd.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-05T17:47:56")
@StaticMetamodel(Store.class)
public class Store_ { 

    public static volatile SingularAttribute<Store, String> image;
    public static volatile SetAttribute<Store, Comments> commentsSet;
    public static volatile SingularAttribute<Store, String> sdt;
    public static volatile SingularAttribute<Store, String> address;
    public static volatile SetAttribute<Store, Menu> menuSet;
    public static volatile SingularAttribute<Store, Date> lastUpdate;
    public static volatile SingularAttribute<Store, String> name;
    public static volatile SingularAttribute<Store, Integer> id;
    public static volatile SetAttribute<Store, Follows> followsSet;
    public static volatile SingularAttribute<Store, User> userId;
    public static volatile SingularAttribute<Store, Category> categoryId;

}