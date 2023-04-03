/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.repository;

import com.hd.pojo.Store;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Duong Hoang
 */
public interface StoreRepository {
    List<Store> getStores(Map<String, String> params);
    Store getStoreById(int id);
    boolean addOrUpdate(Store p);
}
