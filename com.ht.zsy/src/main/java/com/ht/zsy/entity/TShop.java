package com.ht.zsy.entity;

public class TShop {
    private Integer shopid;
    private  Integer allcount;
    private String shopname;

    private Double shopprice;

    private String shopdescription;

    private String shopimageurl;

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname == null ? null : shopname.trim();
    }

    public Double getShopprice() {
        return shopprice;
    }

    public void setShopprice(Double shopprice) {
        this.shopprice = shopprice;
    }

    public String getShopdescription() {
        return shopdescription;
    }

    public void setShopdescription(String shopdescription) {
        this.shopdescription = shopdescription == null ? null : shopdescription.trim();
    }

    public String getShopimageurl() {
        return shopimageurl;
    }

    public void setShopimageurl(String shopimageurl) {
        this.shopimageurl = shopimageurl == null ? null : shopimageurl.trim();
    }

    public Integer getAllcount() {
        return allcount;
    }

    public void setAllcount(Integer allcount) {
        this.allcount = allcount;
    }
}