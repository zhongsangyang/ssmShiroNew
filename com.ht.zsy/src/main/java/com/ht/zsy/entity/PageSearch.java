package com.ht.zsy.entity;

public class PageSearch {
	
	//所有页码
	private int pageshows[];
	//路径
	private String pageUrl;
	//当前页
	private int pageshow;
	// 是否为第一页
    private boolean isFirstPage = false;       
    
    // 是否为最后一页
    private boolean isLastPage = false;      
    
    // 是否有前一页
    private boolean hasPreviousPage = false;
    
    // 是否有下一页
    private boolean hasNextPage = false; 
    //最后一页页码
    private int listPage;
    
    //总记录数量
    private int alltotal;
    
    //总页数
    private int allPages;
    
    
    
	public int getAllPages() {
		return allPages;
	}

	public void setAllPages(int allPages) {
		this.allPages = allPages;
	}

	public int getAlltotal() {
		return alltotal;
	}

	public void setAlltotal(int alltotal) {
		this.alltotal = alltotal;
	}

	public String getPageUrl() {
		return pageUrl;
	}

	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}

	public int[] getPageshows() {
		return pageshows;
	}

	public void setPageshows(int[] pageshows) {
		this.pageshows = pageshows;
	}

	public int getPageshow() {
		return pageshow;
	}

	public void setPageshow(int pageshow) {
		this.pageshow = pageshow;
	}

	public boolean isFirstPage() {
		return isFirstPage;
	}

	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}

	public boolean isLastPage() {
		return isLastPage;
	}

	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}

	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public int getListPage() {
		return listPage;
	}

	public void setListPage(int listPage) {
		this.listPage = listPage;
	}

    

    
}
