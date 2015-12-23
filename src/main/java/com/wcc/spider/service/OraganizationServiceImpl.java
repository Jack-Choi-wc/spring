package com.wcc.spider.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wcc.spider.dao.OrganizationDAO;
import com.wcc.spider.model.Organization;

@Service
public class OraganizationServiceImpl implements OraganizationService {
	
	@Autowired
	private OrganizationDAO oraganizationDAO;
	
	@Override
	public List<Organization> getOrganizationList(){
		return oraganizationDAO.getOrganizationList();
	}
}
