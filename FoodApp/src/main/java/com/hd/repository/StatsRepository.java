/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.hd.repository;

import java.util.Date;
import java.util.List;

/**
 *
 * @author Duong Hoang
 */
public interface StatsRepository {  

    List<Object[]> getSalesStatsByMenuAndYear(int storeId, Date fromDate, Date toDate);
    
    List<Object[]> getSalesStatsByItemsAndYear(int menuId, Date fromDate, Date toDate);
    
    List<Object[]> statsStore();
    
    List<Object[]> statsRevenueStore();
}
