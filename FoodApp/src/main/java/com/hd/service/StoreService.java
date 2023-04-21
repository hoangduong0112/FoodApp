/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.service;

import com.hd.pojo.Store;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Duong Hoang
 */
public interface StoreService {

    List<Store> getStores(Map<String, String> params);

    Store getStoreById(int id);

    String getName(int id);

    boolean addOrUpdate(Store p);
    
    Store getStoreByUserId(int id);
    
     boolean deteleStore(int id);
    
}
