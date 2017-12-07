package com.xiilab.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.xiilab.domain.Member;
import com.xiilab.domain.Questionnaire;
/**
 * 
 * @author xiilab
 * 설문지 레파지토리
 *
 */
public interface QuestionnaireRepository extends JpaRepository<Questionnaire, Long> {
	
	@Query("SELECT new Map(qn.qnno as qnno, qn.subject as subject, qn.post as post, qn.postdate as postdate, qn.stdate as stdate,"
			+ " qn.endate as endate, qn.overview as overview, qn.url as url, qn.regdate as regdate,	qn.updatedate as updatedate, count(r) as count) FROM Questionnaire qn LEFT OUTER JOIN qn.respondents r  where qn.member=?1 GROUP BY qn")
	List<Map> findQuestionnaireByMember(Member member);
	
	@Query("SELECT new Map(SUBSTRING(r.regdate,1,10) as regdate, count(r) as count) FROM Questionnaire qn LEFT OUTER JOIN qn.respondents r  where qn.qnno=:qnno group by SUBSTRING(r.regdate, 1, 10)")
	List<Map> getCountByDate(@Param("qnno")Long qnno);
	
	Questionnaire findTop1ByMemberOrderByQnnoDesc(Member member);
	
	@Query("SELECT qn FROM Questionnaire qn LEFT OUTER JOIN FETCH qn.questions where qn.qnno=:qnno")
	Questionnaire findQuestionnaireByQnno(@Param("qnno")Long qnno);
	
	@Query("SELECT qn FROM Questionnaire qn  where qn.url=:url")
	Questionnaire findQuestionnaireByUrl(@Param("url") String url);
	
}