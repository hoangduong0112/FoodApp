/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hd.service.impl;

import com.hd.repository.StatsRepository;
import com.hd.service.StatsService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Duong Hoang
 */
@Service
public class StatsServiceImpl implements StatsService{

    @Autowired
    private StatsRepository statsRepository;

    @Override
    public List<Object[]> getSalesStatsByMenuAndYear(int storeId, Date fromDate, Date toDate) {
        return this.statsRepository.getSalesStatsByMenuAndYear(storeId, fromDate, toDate);
    }

    @Override
    public List<Object[]> getSalesStatsByItemsAndYear(int menuId, Date fromDate, Date toDate) {
        return this.statsRepository.getSalesStatsByItemsAndYear(menuId, fromDate, toDate);
    }

    @Override
    public List<Object[]> statsStore() {
        return this.statsRepository.statsStore();
    }

    @Override
    public List<Object[]> statsRevenueStore() {
        return this.statsRepository.statsRevenueStore();
    }
    

}
