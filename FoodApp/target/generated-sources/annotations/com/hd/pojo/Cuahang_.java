package com.hd.pojo;

import com.hd.pojo.CuahangOwner;
import com.hd.pojo.Phanloai;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-03-22T17:50:42")
@StaticMetamodel(Cuahang.class)
public class Cuahang_ { 

    public static volatile SingularAttribute<Cuahang, String> diaChi;
    public static volatile SetAttribute<Cuahang, CuahangOwner> cuahangOwnerSet;
    public static volatile SetAttribute<Cuahang, Phanloai> phanloaiSet;
    public static volatile SingularAttribute<Cuahang, Integer> id;
    public static volatile SingularAttribute<Cuahang, Integer> danhGia;
    public static volatile SingularAttribute<Cuahang, String> avatar;
    public static volatile SingularAttribute<Cuahang, String> ten;
    public static volatile SingularAttribute<Cuahang, Short> moCua;

}