package com.xiilab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.java.Log;

@Controller
@Log
public class SampleController {
//	@GetMapping("/hello")
//	public void hello(){
//		log.info("hello...............");
//	}
	@GetMapping("/login")
	public String login(){
		return "login";
		
	}

	@RequestMapping("/home")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/home");
		return modelAndView;
	}
	@RequestMapping("/header")
	public ModelAndView header() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/header");
		return modelAndView;
	}
	@RequestMapping("/footer")
	public ModelAndView footer() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/footer");
		return modelAndView;
	}
	@RequestMapping("/makeSurvey")
	public ModelAndView make() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/makeSurvey");
		return modelAndView;
	}
	@RequestMapping("/manageSurvey")
	public ModelAndView manage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/manageSurvey");
		return modelAndView;
	}
	@RequestMapping("/manageOrg")
	public ModelAndView relManage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/manageOrg");
		return modelAndView;
	}
	@RequestMapping("/help")
	public ModelAndView help() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/help");
		return modelAndView;
	}
	@RequestMapping("/result")
	public ModelAndView result() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/result");
		return modelAndView;
	}
	@RequestMapping("/poll")
	public ModelAndView poll() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/poll");
		return modelAndView;
	}
	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/join");
		return modelAndView;
	}
	@RequestMapping("modify")
	public ModelAndView modify() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("modify");
		return modelAndView;
	}
	@RequestMapping("/guest")
	public void forGuest(){
		log.info("guest");
	}
	
	@RequestMapping("/manager")
	public void forManager(){
		log.info("manager");
	}
	
	@RequestMapping("/admin")
	public void forAdmin(){
		log.info("admin");
	}
}
