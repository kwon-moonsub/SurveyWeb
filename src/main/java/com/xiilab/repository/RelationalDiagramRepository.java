package com.xiilab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.xiilab.domain.Member;
import com.xiilab.domain.RelationalDiagram;

public interface RelationalDiagramRepository extends JpaRepository<RelationalDiagram, Long> {
	
	@Query("SELECT new RelationalDiagram(rd.rdno, rd.name, rd.regdate, rd.updatedate) FROM RelationalDiagram rd where rd.member=:member")
	List<RelationalDiagram> findRelationalDiagramByMember(@Param("member")Member member);
	
	@Query("SELECT rd FROM RelationalDiagram rd LEFT OUTER JOIN FETCH rd.nodes where rd.rdno=:rdno")
	RelationalDiagram findQuestionnaireByRdno(@Param("rdno")Long rdno);
		
}
 