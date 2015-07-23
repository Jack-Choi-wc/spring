package com.wcc.spider.service;

import java.util.List;

import com.wcc.spider.model.Member;

public interface MemberService {

	public Member getMember(Member member);	
	
	public void insertMember(Member member);

	public List<Member> getMemberList();	
}
