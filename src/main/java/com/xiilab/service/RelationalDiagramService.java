package com.xiilab.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.xiilab.domain.Member;
import com.xiilab.domain.RelationalDiagram;
import com.xiilab.repository.RelationalDiagramRepository;
import com.xiilab.util.ExcelManager;

import lombok.extern.java.Log;

@Service
@Transactional
@Log
public class RelationalDiagramService {
	
	@Autowired
	RelationalDiagramRepository repo;
	
	
	public List<RelationalDiagram> listDiagram(Member member){
		return repo.findRelationalDiagramByMember(member);
	}
	
	public RelationalDiagram getRelationalDiagram(Long rdno){
		return repo.findQuestionnaireByRdno(rdno);
	}
	
	public void deleteDiagram(Long rdno){
		repo.findById(rdno).ifPresent(diagram -> {
			repo.delete(diagram);
		});
	}
	public void uploadExcelDiagram(RelationalDiagram rd, MultipartFile multipartFile){
		ExcelManager manager = new ExcelManager(multipartFile);
		
		rd.setNodes(manager.makeNodeTree());
		
		repo.save(rd);
	}
}
