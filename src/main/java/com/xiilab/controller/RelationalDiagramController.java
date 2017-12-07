package com.xiilab.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xiilab.domain.Member;
import com.xiilab.domain.RelationalDiagram;
import com.xiilab.service.RelationalDiagramService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/diagram/")
@Log
public class RelationalDiagramController {
	@Autowired
	RelationalDiagramService service;
	
	@GetMapping("/download/")
	public void download(HttpServletRequest request, HttpServletResponse response){
			String dataDirectory = request.getServletContext().getRealPath("/WEB-INF/download/");
			String fileName ="sample.xlsx";
			Path file = Paths.get(dataDirectory, fileName);
			log.info(file.toString());
			  if (Files.exists(file)) 
		        {
		            response.setContentType("application/ms-excel");
		            response.addHeader("Content-Disposition", "attachment; filename="+fileName);
		            try
		            {
		                Files.copy(file, response.getOutputStream());
		                response.getOutputStream().flush();
		            } 
		            catch (IOException ex) {
		                ex.printStackTrace();
		            }
		        }

	
		
	}
	
	@GetMapping("/list/{mno}")
	public ResponseEntity<List<RelationalDiagram>> list(@PathVariable("mno")Long mno){
		log.info("diagram/");
		log.info("" + mno);
		Member member = new Member();
		member.setMno(mno);
		

		return new ResponseEntity<>(service.listDiagram(member), HttpStatus.CREATED);
		
	}
	
	@GetMapping("/{rdno}")
	public ResponseEntity<RelationalDiagram> getRelationalDiagram(@PathVariable("rdno")Long rdno){
		log.info("diagram/");
		log.info("" + rdno);
		

		return new ResponseEntity<>(service.getRelationalDiagram(rdno), HttpStatus.CREATED);
		
	}
	
	@GetMapping("/excel")
	public ModelAndView excel(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("excelUploadTest");
		return mav;
	}
	
	@PostMapping("/excel/{mno}")
    public void readExcel(@PathVariable("mno")Long mno, @RequestParam("fileName") String fileName, @RequestParam("excelFile") MultipartFile multipartFile)
                                                throws IOException {
		log.info("excel/upload");
		log.info(multipartFile.getInputStream().toString());
		log.info(multipartFile.getBytes().toString());
		
		Member member = new Member();
		RelationalDiagram rd = new RelationalDiagram();
		rd.setName(fileName);
		member.setMno(mno);
		rd.setMember(member);
		service.uploadExcelDiagram(rd, multipartFile);
		
	}

	@DeleteMapping("/{rdno}")
	public void deleteDiagram(@PathVariable("rdno")Long rdno){
		log.info("delete relational diagram");
		
		
		
		service.deleteDiagram(rdno);
	}

	
}
