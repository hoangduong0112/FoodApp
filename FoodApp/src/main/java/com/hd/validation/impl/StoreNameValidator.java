/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.validation.impl;

import com.hd.service.StoreService;
import com.hd.validation.StoreName;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Duong Hoang
 */
public class StoreNameValidator implements ConstraintValidator<StoreName, String> {

    @Autowired
    private StoreService storeService;

    @Override
    public void initialize(StoreName constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        try {
            if (this.storeService.existByName(value)) {
                return false;
            }
        }catch(NullPointerException e){
            return false;
        }

        return true;
    }

}
