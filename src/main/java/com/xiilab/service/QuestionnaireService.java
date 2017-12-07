package com.xiilab.service;

import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.stream.IntStream;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiilab.domain.Member;
import com.xiilab.domain.Questionnaire;
import com.xiilab.repository.QuestionnaireRepository;

import lombok.extern.java.Log;

@Service
@Transactional
@Log
public class QuestionnaireService {
	@Autowired
	QuestionnaireRepository repo;
	
	private String baseUrl = "localhost";
	
	public List<Map> listQuestionnaire(Member member){
		List<Map> result = repo.findQuestionnaireByMember(member);
		result.forEach(map ->{
			LocalDateTime endate = (LocalDateTime)map.get("endate");
			LocalDateTime currentTime = LocalDateTime.now();
		
			Period period = Period.between(currentTime.toLocalDate(), endate.toLocalDate());
			map.put("remainDay", period.getDays());
		});
		
		return result;
	}
	
	public List<Map> getCountByDay(Long qnno){
		return repo.getCountByDate(qnno);
	}
	
	public Questionnaire getQuestionnaire(Long qnno){
		return repo.findQuestionnaireByQnno(qnno);
	}
	
	public Questionnaire addQuestionnaire(Member member, Questionnaire questionnaire){
		
		this.makeQuestionNo(questionnaire);
		Questionnaire result = null;
		if(questionnaire.getQnno() == null){
			log.info("add question");
			questionnaire.setMember(member);
			repo.save(questionnaire);
			result = repo.findTop1ByMemberOrderByQnnoDesc(member);
		
		}else{
			log.info("update question");
			result = this.updateQuestionnaire(questionnaire);
			
		}
		return result;
		
	}
	
	public Questionnaire updateQuestionnaire(Questionnaire questionnaire){
		this.makeQuestionNo(questionnaire);
		repo.findById(questionnaire.getQnno()).ifPresent(origin -> {
			origin.setSubject(questionnaire.getSubject());
			origin.setQpw(questionnaire.getQpw());
			origin.setStdate(questionnaire.getStdate());
			origin.setEndate(questionnaire.getEndate());
			origin.setOverview(questionnaire.getOverview());
			origin.setUpdatedate(LocalDateTime.now()); 
			
				origin.setRelationDiagram(questionnaire.getRelationDiagram());
			
			origin.setQuestions(questionnaire.getQuestions());
			repo.save(origin);
		});
		
		return getQuestionnaire(questionnaire.getQnno());
	}
	
	public void deleteQuestionnaire(Long qnno){
		repo.deleteById(qnno);
	}
	
	public String postQuestionnaire(Long qnno){
		
		
	
		Optional<Questionnaire> result = repo.findById(qnno);
		
		String token = null;
		if(result != null ){
			Questionnaire questionnaire = result.get();
			token = questionnaire.getUrl();
			if(token == null){
				token = makeRandomStringToken(7);
				
				while(repo.findQuestionnaireByUrl(token) != null){
					
					token = makeRandomStringToken(7);
					log.info(token);
				}
				questionnaire.setUrl(token);
				questionnaire.setPost(true);
				questionnaire.setPostdate(LocalDateTime.now());
				repo.save(questionnaire);	
			}
			
		}
		String url = makeUrl(token);
		return url;
	}
	
	private String makeRandomStringToken(int length){
		char[] tokens = new char[length];
		
		IntStream.range(0, length).forEach(i ->{
			
			Random random = new Random();
			
			int value = random.nextInt(26);
			boolean isSmall = random.nextBoolean();
		
			if(isSmall){
				value += 65;
			}else{
				value += 97;
			}
			
			tokens[i] = (char)value;
		});
		return new String(tokens, 0, tokens.length);
		
	}
	private void makeQuestionNo(Questionnaire questionnaire){
		for(int i = 0 ; i < questionnaire.getQuestions().size() ; i++){
			questionnaire.getQuestions().get(i).setQuestionno(i+1);
		}
	}
	private String makeUrl(String token) {
		URL url = null;
		try {
			url = new URL("http", this.baseUrl, 8080, "/answer/" + token);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url.toString();
	}
	
	public Questionnaire getQuestionnaireByToken(String token){
		Questionnaire questionniare = repo.findQuestionnaireByUrl(token);
	
		return questionniare;
	}
}
