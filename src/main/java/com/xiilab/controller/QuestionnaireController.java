package com.xiilab.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xiilab.domain.Member;
import com.xiilab.domain.Questionnaire;
import com.xiilab.service.QuestionnaireService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/questionnaire/")
@Log
public class QuestionnaireController {
	
	@Autowired
	QuestionnaireService service;
	
	@GetMapping("/list/{mno}")
	public  ResponseEntity<List<Map>> list(@PathVariable("mno") Long mno){
		log.info("questionnaire/" + mno);
		
		Member member = new Member();
		member.setMno(mno);
		
		return new ResponseEntity<>(service.listQuestionnaire(member), HttpStatus.OK);
		
	}
	
	@GetMapping("/count/day/{qnno}")
	public  ResponseEntity<List<Map>> countByDate(@PathVariable("qnno") Long qnno){
		log.info("questionnaire/count/day/" + qnno);
		
		
		return new ResponseEntity<>(service.getCountByDay(qnno), HttpStatus.OK);
		
	}
	
	@GetMapping("/{qnno}")
	public  ResponseEntity<Questionnaire> getQuestionnaire(@PathVariable("qnno") Long qnno){
		log.info("questionnaire/" + qnno);
		
		return new ResponseEntity<>(service.getQuestionnaire(qnno), HttpStatus.OK);
		
	}
	
	@PostMapping("/{mno}")
	public ResponseEntity<Questionnaire> addQuestionnaire(@PathVariable("mno") Long mno, @RequestBody Questionnaire questionnaire){
		log.info("questionnaire/" + mno);
		log.info("" + questionnaire);
		Member member = new Member();
		member.setMno(mno);
		//log.info(questionnaire.getRelationDiagram());
		return new ResponseEntity<>(service.addQuestionnaire(member, questionnaire), HttpStatus.CREATED);
		
	}
	
	@DeleteMapping("/{mno}/{qnno}")
	public  ResponseEntity<List<Map>> deleteQuestionnaire(
			@PathVariable("mno")Long mno, 
			@PathVariable("qnno") Long qnno){
		log.info("questionnaire/" + mno + "/" + qnno);
		
		
		service.deleteQuestionnaire(qnno);
		
		Member member = new Member();
		member.setMno(mno);
		return new ResponseEntity<>(service.listQuestionnaire(member), HttpStatus.OK);
		
	}
	
	@PutMapping
	public  ResponseEntity<Questionnaire> updateQuestionnaire(@RequestBody Questionnaire questionnaire){
		log.info("update questionnaire");
		log.info("" + questionnaire);
		log.info("" + questionnaire.getQuestions());
		log.info("" + questionnaire.getQuestions().get(0).getObjectiveItems());
		return new ResponseEntity<>(service.updateQuestionnaire(questionnaire), HttpStatus.OK); 
		
	}
	
	@PutMapping("/post/{qnno}")
	public  ResponseEntity<Map> postQuestionnaire(@PathVariable("qnno")Long qnno){
		log.info("questionnaire/post/" + qnno);
		
		
		
		return new ResponseEntity<>(Collections.singletonMap("msg", service.postQuestionnaire(qnno)), HttpStatus.OK);
		
	}
	
	@GetMapping("/token/{token}")
	public  ResponseEntity<Questionnaire> getQuestionnaireByToken(@PathVariable("token") String token){
		log.info("questionnaire/" + token);
		
		return new ResponseEntity<>(service.getQuestionnaireByToken(token), HttpStatus.OK);
		
	}
	
}
