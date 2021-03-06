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

import com.wcc.spider.model.Member;
import com.wcc.spider.service.MemberService;

@RequestMapping(value = "/jqgrid")
@Controller
public class JqGridController {
	
	private static Log log = LogFactory.getLog(JqGridController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Resource
	private MappingJackson2JsonView jsonView;
	
	/***
	 * getjqGridArrayList
	 * local data test.
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "arrayList.do", method = {RequestMethod.GET})
    public String getjqGridArrayList(Model model) {
    	List<Member> list = memberService.getMemberList();
    	model.addAttribute("list", list);
    	log.debug("getjqGridMemberList ");
    	return "/jqgrid/arrayList";
    }
    
    /***
     * list.
     * @param model
     * @return
     */
    @RequestMapping(value = "list.do", method = {RequestMethod.GET})
    public String getList(Model model) {
    	log.debug("getList ");
    	return "/jqgrid/list";
    }
    
    /***
     * getJsonMemberList 
     * JqGrid JSON test.
     * @param model
     * @return
     */
    @RequestMapping(value = "jsonList.do", method = {RequestMethod.GET})
    public View getJsonMemberList(Model model) {
    	List<Member> list = memberService.getMemberList();
    	model.addAttribute("rows", list);
    	model.addAttribute("limit", 5);
    	model.addAttribute("page", 1);
    	log.debug("getJsonMemberList ");
    	return jsonView;
    }
    
}

