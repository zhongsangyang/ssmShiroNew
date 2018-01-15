package com.ht.zsy.po;

public class TreeVo {
	private String id;
	private String pId;
	private String name;
	private String open;
	public TreeVo(){
		
	}
	public TreeVo(String id, String pId, String name, String open) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.open = open;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	@Override
	public String toString() {
		return "TreeVo [id=" + id + ", pId=" + pId + ", name=" + name + ", open=" + open + "]";
	}
	
}
