package com.wcc.spider.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper=true)
public class Organization {
	private String id;
	private String text;
	private String parent;
	private String icon;
	private String state;
	private String updateId;
	private Date updateDt;
}

