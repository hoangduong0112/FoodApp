/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hd.pojo.Store;
import com.hd.repository.StoreRepository;
import com.hd.service.StoreService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    public Cloudinary cloudinary;
    @Autowired
    private StoreRepository storeRepository;
    
    @Override
    public List<Store> getStores(Map<String, String> params) {
        return this.storeRepository.getStores(params);
    }
    
    @Override
    public Store getStoreById(int id) {
        return this.storeRepository.getStoreById(id);
    }

    @Override
    public String getName(int id) {       
        return this.storeRepository.getStoreById(id).getImage();
    }

    @Override
    public boolean addOrUpdate(Store p) {

        if(!p.getFile().isEmpty()){
            try {
                Map res =this.cloudinary.uploader().upload(p.getFile().getBytes(), ObjectUtils.asMap("resource type", "auto"));
                p.setImage(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(StoreServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return this.storeRepository.addOrUpdate(p); 
    }

    @Override
    public Store getStoreByUserId(int id) {
        return this.storeRepository.getStoreByUserId(id);
    }

    @Override
    public boolean deteleStore(int id) {
        return this.storeRepository.deteleStore(id);
    }
    
}
