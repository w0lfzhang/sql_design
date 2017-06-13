package com.cve.vo;

import java.util.Date;

public class Cve {
	private int cid;
	private String cve_name;
	private String authour;
	private Date published_time;
	private String description;
	private int type;
	private String app_name;
	private String company;
	private String platform;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCve_name() {
		return cve_name;
	}
	public void setCve_name(String cve_name) {
		this.cve_name = cve_name;
	}
	public String getAuthour() {
		return authour;
	}
	public void setAuthour(String authour) {
		this.authour = authour;
	}
	public Date getPublished_time() {
		return published_time;
	}
	public void setPublished_time(Date published_time) {
		this.published_time = published_time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getApp_name() {
		return app_name;
	}
	public void setApp_name(String app_name) {
		this.app_name = app_name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPlatform() {
		return platform;
	}
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	
	
}
