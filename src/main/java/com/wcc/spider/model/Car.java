package com.wcc.spider.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString(callSuper=true)
public class Car {
	private String carNo;
	private String year;
	private String updateId;
	private Date updateDt;
}
