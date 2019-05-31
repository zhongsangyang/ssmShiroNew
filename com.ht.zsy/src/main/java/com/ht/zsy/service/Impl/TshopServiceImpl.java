package com.ht.zsy.service.Impl;

import com.ht.zsy.dao.TshopMapper;
import com.ht.zsy.entity.TShop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TshopServiceImpl implements TshopService {
    @Autowired
    private TshopMapper tshopMapper;


    @Override
    public List<TShop> selectShopList(Integer pageindex, Integer pagenum) {
        return tshopMapper.selectShopList(pageindex,pagenum);
    }

    @Override
    public int insertSelective(TShop record) {
        return tshopMapper.insertSelective(record);
    }

    @Override
    public TShop selectByPrimaryKey(Integer shopid) {
        return tshopMapper.selectByPrimaryKey(shopid);
    }
}
