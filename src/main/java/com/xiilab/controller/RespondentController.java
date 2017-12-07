package com.xiilab.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xiilab.domain.Respondent;
import com.xiilab.service.RespondentService;

import lombok.extern.java.Log;


@RequestMapping("/answer/")
@Log
@RestController
public class RespondentController {
	@Autowired
	RespondentService service;
	
	
	@GetMapping("/{token}")
	public  ModelAndView getQuestionnaire(@PathVariable("token") String token, ModelAndView modelAndView){
		log.info("answer/" + token);
		
		
		modelAndView.addObject("token",token);
		
		modelAndView.setViewName("poll");
		return modelAndView;
		
	}
	
	@PostMapping
	public   ResponseEntity<Map> addRespondent(@RequestBody Respondent respondent, HttpServletRequest request){
		log.info("add Respondent");
		log.info("" + respondent.getQuestionnaire());

		
		respondent.setIpAddress(request.getRemoteAddr());
		service.addRespondent(respondent);
		
		return new ResponseEntity<>(Collections.singletonMap("msg", "success"), HttpStatus.OK);
		
	}
	
	@GetMapping("/list/{qnno}")
	public  ResponseEntity<List<Map>> getAnswers(@PathVariable("qnno") Long qnno){
		log.info("answer/list" + qnno);
		List<Map> answers = service.getAnswersList(qnno);
		return new ResponseEntity<>(answers, HttpStatus.OK);
		
	}
}
