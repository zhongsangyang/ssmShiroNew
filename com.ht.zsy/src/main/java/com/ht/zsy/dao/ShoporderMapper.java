package com.ht.zsy.dao;

import com.ht.zsy.entity.Shoporder;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoporderMapper {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Shoporder record);

    int insertSelective(Shoporder record);

    Shoporder selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Shoporder record);

    int updateByPrimaryKey(Shoporder record);

    Shoporder selectoneOrder(@Param("userid")Integer userid,@Param("shopid")Integer shopid);

    List<Shoporder> selectgowuche(@Param("pageIndex") Integer pageIndex1, @Param("pageNum") Integer pageNum1,@Param("userid") Integer userid);
}