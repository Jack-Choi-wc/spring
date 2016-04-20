package com.wcc.spider.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Controller
public class SnsController {
	
	//private static final String VIEW_PREFIX = "member";
	//private static Log log = LogFactory.getLog(MemberController.class);
	
//	@Autowired
//	private MemberService memberService;
	
	@Resource
	private MappingJackson2JsonView jsonView;
	    /***
     * getMemberList
     * get member list.
     * @param model
     * @return Member list.
     */
    @RequestMapping(value = "/sns/list.do", method = {RequestMethod.GET})
    public String getMemberList(Model model) {
    	
    	
    	return "/sns/list";
    }
    
}

