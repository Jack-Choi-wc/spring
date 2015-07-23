package com.wcc.spider.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.wcc.spider.model.Member;
@Repository
public interface MemberDAO {
	public Member getMember(Member member);		
	
	public void insertMember(Member member);
	
	public List<Member> getMemberList();
}
