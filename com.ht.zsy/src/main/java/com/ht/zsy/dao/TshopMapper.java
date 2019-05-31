package com.ht.zsy.dao;

import com.ht.zsy.entity.TShop;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TshopMapper {
    int deleteByPrimaryKey(Integer shopid);

    int insert(TShop record);

    int insertSelective(TShop record);

    TShop selectByPrimaryKey(Integer shopid);

    int updateByPrimaryKeySelective(TShop record);

    int updateByPrimaryKey(TShop record);

    List<TShop>  selectShopList(@Param("pageIndex") Integer pageIndex1, @Param("pageNum") Integer pageNum1);


}