package com.wcc.spider.dao;

import org.springframework.stereotype.Repository;

import com.wcc.spider.model.Car;
@Repository
public interface CarDAO {
	
	public void insertCar(Car car);
}


