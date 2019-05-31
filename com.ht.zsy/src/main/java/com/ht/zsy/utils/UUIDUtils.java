package com.ht.zsy.utils;

import java.util.UUID;

/**
 * @Author:伍群斌
 * @Description:
 * @Date:2018/8/10 15:55
 */
public class UUIDUtils {
    public static String getUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static void main(String[] args) {
        System.out.println("格式前的UUID ： " + UUID.randomUUID().toString());
        System.out.println("格式化后的UUID ：" + getUUID());
    }
}
