package com.ht.zsy.service.Impl;

import com.ht.zsy.entity.Shoporder;

import java.util.List;

public interface ShoporderService {
    int insert(Shoporder record);
    Shoporder selectOrderisExit( Integer userid,Integer shopid);
    int updateByPrimaryKeySelective(Shoporder record);
    List<Shoporder> selectgowuche(Integer pageindex,Integer pageNum,Integer userid);
    int deleteByPrimaryKey(Integer orderid);
}
