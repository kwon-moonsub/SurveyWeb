package com.xiilab.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.xiilab.domain.Member;
import com.xiilab.repository.MemberRepository;

import lombok.extern.java.Log;

@Service
@Log
public class ZerockUsersService implements UserDetailsService {
	@Autowired
	MemberRepository repo;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserDetails result = null;
		Member member = repo.findMemberByEmail(username);
		log.info("" + member);
		if(member != null){
			result =  new ZerockSecurityUser(member);
		}
				
			return result;	
	}
}
