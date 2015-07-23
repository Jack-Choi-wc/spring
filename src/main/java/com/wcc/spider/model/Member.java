package com.wcc.spider.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper=true)
public class Member {
	private String memberNo;
	private String name;
	private String email;
	private String updateId;
	private Date updateDt;
}
