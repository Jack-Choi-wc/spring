package com.wcc.spider.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wcc.spider.model.Organization;
@Repository
public interface OrganizationDAO {
		
	public List<Organization> getOrganizationList();
}
