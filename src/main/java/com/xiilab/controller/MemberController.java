package com.xiilab.controller;

import java.util.Collections;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xiilab.domain.Member;
import com.xiilab.service.MemberService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/member/")
@Log
public class MemberController {
	
	@Autowired
	MemberService service;
	
	
	
	@PostMapping()
	public ResponseEntity<Map> addMember(@Valid @RequestBody Member member, BindingResult bindingResult){
		log.info("register post");
		log.info("" + member);
		String code = "msg";
		
		String message = "success";
		HttpStatus status = HttpStatus.OK;
		if(bindingResult.hasErrors()){
			
			
			FieldError error = bindingResult.getFieldError();
			/*FieldError error = bindingResult.getFieldError("email");
		
			*/
			code = error.getField();
			message = error.getDefaultMessage();
			
			status = HttpStatus.BAD_REQUEST;
			
		}
		else{
			log.info("success join member");
			//service.join(member);
		}
		
		return new ResponseEntity<>(Collections.singletonMap(code, message),  status);
		
	}
	
	@PostMapping("/check")
	public  ResponseEntity<Map> check(@RequestBody Member member){
		log.info("check email");
		log.info("" + member.getEmail());
		
		return new ResponseEntity<>(Collections.singletonMap("msg", service.checkId(member.getEmail())), HttpStatus.OK);
	}
	
	@PutMapping()
	public ResponseEntity<Map> modify(@RequestBody Member member){
		
		log.info("modify post");
		log.info("member : " + member);
		service.udpate(member);
		
		return new ResponseEntity<>(Collections.singletonMap("msg", "success"), HttpStatus.OK);
		
	}
	
	@DeleteMapping("/{mno}")
	public ResponseEntity<Map> delete(@PathVariable("mno")Long mno){
		
		log.info("delete post");
		log.info("mno : " + mno);
		service.delete(mno);
		
		return new ResponseEntity<>(Collections.singletonMap("msg", "success"), HttpStatus.OK);
		
	}
	
	
	
}
