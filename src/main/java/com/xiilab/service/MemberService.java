package com.xiilab.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.xiilab.domain.Member;
import com.xiilab.repository.MemberRepository;

import lombok.extern.java.Log;

@Service
@Transactional
@Log
public class MemberService {
	
	@Autowired
	MemberRepository repo;
	
	@Autowired
	PasswordEncoder pwEncoder;
	
	public Member login(Member member){
		Member result = repo.findByEmailAndMpw(member.getEmail(), member.getMpw());
		return result;
	}
	
	public void join(Member member){
		String encryptPw = pwEncoder.encode(member.getMpw());
		
		log.info("en: " + encryptPw);
		
		member.setMpw(encryptPw);
		repo.save(member);
	}
	
	public boolean checkId(String email){
		boolean isEmail = false;
		log.info(email);
		Member member = repo.findMemberByEmail(email);
		log.info(""+member);
		if(member != null){
			isEmail = true;
		}
		return isEmail;
	}
	
	public void udpate(Member member){
		repo.findById(member.getMno()).ifPresent(origin ->{
			origin.setName(member.getName());
			origin.setMpw(member.getMpw());
			repo.save(origin);
			
		});
	}
	
	public void delete(Long mno){
		repo.deleteById(mno);
	}

	
}
