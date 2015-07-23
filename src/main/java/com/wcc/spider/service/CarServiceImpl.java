package com.wcc.spider.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.wcc.spider.dao.CarDAO;
import com.wcc.spider.model.Car;

public class CarServiceImpl implements CarService {
	@Autowired
	private CarDAO carDAO;
	@Override
	public void insertCar(Car car){
		carDAO.insertCar(car);
	}
}
