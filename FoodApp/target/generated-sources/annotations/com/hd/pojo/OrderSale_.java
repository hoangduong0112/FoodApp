package com.hd.pojo;

import com.hd.pojo.OrderItems;
import com.hd.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-05-01T16:04:40")
@StaticMetamodel(OrderSale.class)
public class OrderSale_ { 

    public static volatile SingularAttribute<OrderSale, Date> createdDate;
    public static volatile SingularAttribute<OrderSale, Integer> id;
    public static volatile SetAttribute<OrderSale, OrderItems> orderItemsSet;
    public static volatile SingularAttribute<OrderSale, User> userId;

}