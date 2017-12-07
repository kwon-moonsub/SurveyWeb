package com.xiilab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.xiilab.domain.Parent;
import com.xiilab.repository.ParentRepository;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/parent/")
@Log
public class ParentController {
	@Autowired
	ParentRepository repo;
	
	@PostMapping("/{parentId}")
	public void addParent(@PathVariable("parentId") String parentId, @RequestBody Parent parent){
		log.info("parent/" + parentId);
		
		log.info("" + parent);
		log.info("" + parent.getChildren());
		
	}
}
