package com.hd.pojo;

import com.hd.pojo.Store;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-04-21T17:07:15")
@StaticMetamodel(Category.class)
public class Category_ { 

    public static volatile SingularAttribute<Category, String> name;
    public static volatile SetAttribute<Category, Store> storeSet;
    public static volatile SingularAttribute<Category, Integer> id;

}