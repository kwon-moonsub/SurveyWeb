package com.xiilab.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiilab.domain.Answer;
import com.xiilab.domain.Question;
import com.xiilab.domain.Respondent;
import com.xiilab.repository.AnswerRepository;
import com.xiilab.repository.QuestionnaireRepository;
import com.xiilab.repository.RespondentRepository;

import lombok.extern.java.Log;
@Log
@Service
@Transactional
public class RespondentService {
	
	@Autowired
	RespondentRepository respondentRepo;
	
	@Autowired
	AnswerRepository repo;
	
	@Autowired
	QuestionnaireRepository questionnaireRepo;
	
	public void addRespondent(Respondent respondent){
		respondentRepo.save(respondent);
		
	}
	
	public List<Map> getAnswersList(Long qnno){
		List<Map> result = new ArrayList<>();
		
		
		questionnaireRepo.findById(qnno).ifPresent(questionnaire -> {
			log.info(questionnaire.getQuestions().get(0).getQno() + "");
			
			
			questionnaire.getQuestions().forEach(question ->{
				Map qna = new HashMap();
				qna.put("question", question);
				qna.put("answers", getAnswerList(question.getQno()));
				
				result.add(qna);
			});
		});
		
		return result;
	}
	
	private List<Answer> getAnswerList(Long qno){
		Question question = new Question();
		question.setQno(qno);
		List<Answer> answers = repo.findAnswerByQuestion(question);
		return answers;
	}
}
