package com.wcc.spider.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.wcc.spider.model.Member;
import com.wcc.spider.service.MemberService;

@Controller
public class MemberController {
	
	//private static final String VIEW_PREFIX = "member";
	//private static Log log = LogFactory.getLog(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Resource
	private MappingJackson2JsonView jsonView;
	/***
	 * getMember
	 * get Member by member No.
	 * @param model
	 * @param memberNo
	 * @return Member
	 */
    @RequestMapping(value = "/members/{memberNo}", method = {RequestMethod.GET})
    public View getMember(Model model,
    		      @PathVariable(value="memberNo") String memberNo) {
    	Member member = new Member();
    	member.setMemberNo(memberNo);
    	Member rtnMember = memberService.getMember(member);
    	model.addAttribute("member", rtnMember);
    	return jsonView;
    }
     

    /***
     * add member
     * 
     * @param model
     * @param memberNo
     * @param name
     * @param email
     * @return
     */
    @RequestMapping(value = "/members/{memberNo}", method = {RequestMethod.PUT})
    public View addmember(Model model,
							@PathVariable(value="memberNo") String memberNo,
							@RequestParam(value="name",required = false) String name,
	    				    @RequestParam(value="email",required = false) String email) {
   
    	String rtnString = "sucess";
    	Member member = new Member();
    	member.setName(name);
    	member.setMemberNo(memberNo);
    	member.setEmail(email);
    	member.setUpdateId(memberNo);
    		
    	try{
    		memberService.insertMember(member);
    	}catch(Exception e){
    		e.printStackTrace();
    		rtnString = "fail";
    	}
    	model.addAttribute("isSucess", rtnString);
    	return jsonView;
    }
    
    
    /***
     * getMemberList
     * get member list.
     * @param model
     * @return Member list.
     */
    @RequestMapping(value = "/member/list.do", method = {RequestMethod.GET})
    public String getMemberList(Model model) {
    	List<Member> list = memberService.getMemberList();
    	model.addAttribute("list", list);
    	return "/member/list";
    }
    
}

