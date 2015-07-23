package com.wcc.spider.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wcc.spider.dao.CarDAO;
import com.wcc.spider.dao.MemberDAO;
import com.wcc.spider.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private CarDAO carDAO;
	
	@Override
	public Member getMember(Member member){
		return memberDAO.getMember(member);
	}

	@Transactional(readOnly=false,propagation = Propagation.REQUIRED)
	@Override
	public void insertMember(Member member){
		 memberDAO.insertMember(member);
	}
	
	@Override
	public List<Member> getMemberList(){
		return memberDAO.getMemberList();
	}
}
