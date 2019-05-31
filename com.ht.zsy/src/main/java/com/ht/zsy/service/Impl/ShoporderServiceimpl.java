package com.ht.zsy.service.Impl;

import com.ht.zsy.dao.ShoporderMapper;
import com.ht.zsy.entity.Shoporder;
import com.ht.zsy.entity.TShop;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShoporderServiceimpl implements ShoporderService {

    @Resource
    private ShoporderMapper shoporderMapper;
    @Override
    public int insert(Shoporder record) {
        return shoporderMapper.insert(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer orderid) {
        return shoporderMapper.deleteByPrimaryKey(orderid);
    }

    @Override
    public Shoporder selectOrderisExit(Integer userid, Integer shopid) {
        return shoporderMapper.selectoneOrder(userid,shopid);
    }

    @Override
    public int updateByPrimaryKeySelective(Shoporder record) {
        return shoporderMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public List<Shoporder> selectgowuche(Integer pageInde,Integer pageNum,Integer userid) {
        return shoporderMapper.selectgowuche(pageInde,pageNum,userid);
    }

}
