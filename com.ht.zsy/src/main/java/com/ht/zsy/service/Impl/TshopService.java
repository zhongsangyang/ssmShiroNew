package com.ht.zsy.service.Impl;

import com.ht.zsy.entity.TShop;

import java.util.List;

public interface TshopService {
    List<TShop> selectShopList(Integer pageindex, Integer pagenum);
    TShop selectByPrimaryKey(Integer shopid);
    int insertSelective(TShop record);
}
