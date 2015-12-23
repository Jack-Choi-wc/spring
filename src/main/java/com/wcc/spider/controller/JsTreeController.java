package com.wcc.spider.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.wcc.spider.model.Organization;
import com.wcc.spider.service.OraganizationService;

@RequestMapping(value = "/jstree")
@Controller
public class JsTreeController {
	
	private static Log log = LogFactory.getLog(JsTreeController.class);
	
	@Autowired
	private OraganizationService oraganizationService;
	
	@Resource
	private MappingJackson2JsonView jsonView;
	
	/***
     * list.
     * @param model
     * @return
     */
    @RequestMapping(value = "list.do", method = {RequestMethod.GET})
    public String getList(Model model) {
    	log.debug("getList ");
    	return "/jstree/list";
    }
    
    /***
     * getOrganizationList 
     * jsTree JSON test.
     * @param model
     * @return
     */
    @RequestMapping(value = "jsonList.do", method = {RequestMethod.GET})
    public View getOrganizationList(Model model) {
    	List<Organization> list = oraganizationService.getOrganizationList();
    	model.addAttribute("list", list);
    	log.debug("getOrganizationList ");
    	return jsonView;
    }
    
    
  
}

