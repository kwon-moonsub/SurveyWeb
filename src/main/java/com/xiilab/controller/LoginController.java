package com.xiilab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xiilab.service.MemberService;

import lombok.extern.java.Log;

@RestController
@Log
public class LoginController {
	
	@Autowired
	MemberService service;
	
	/*
	@PostMapping("/login")
	public ResponseEntity<Member> loginPost(@RequestBody Member member){
		log.info("" + member);
		Member result = service.login(member);
		log.info("" + result);
		if(result != null){
			result.setMpw("");	
		}
		return new ResponseEntity<>(result, HttpStatus.OK);
		
	}
	*/
	
	@GetMapping("/accessDenied")
	public void accessDenied(){
		
	}
}
