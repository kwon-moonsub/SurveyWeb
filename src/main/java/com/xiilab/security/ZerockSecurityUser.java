package com.xiilab.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.xiilab.domain.Member;
import com.xiilab.domain.MemberRole;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ZerockSecurityUser extends User {
	private static final String ROLE_PREFIX = "ROLE_";
	
	private Long mno;
	
	public ZerockSecurityUser(Member member){
		super(member.getEmail(), member.getMpw(), makeGrantedAuthority(member.getRoles()));
		this.mno = member.getMno();
	}
	public ZerockSecurityUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}
	
	private static List<GrantedAuthority> makeGrantedAuthority(List<MemberRole> roles){
		List<GrantedAuthority> list = new ArrayList<>();
		
		roles.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role.getRoleName())));
		return list;
	}

}
