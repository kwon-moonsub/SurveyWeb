package com.xiilab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xiilab.domain.Member;


public interface MemberRepository extends JpaRepository<Member, Long>{
	public Member findMemberByEmail(String email);
	public Member findByMno(Long mno);
	public Member findByEmailAndMpw(String email, String mpw);
}
