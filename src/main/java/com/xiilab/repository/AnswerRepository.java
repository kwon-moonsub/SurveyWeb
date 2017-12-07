package com.xiilab.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xiilab.domain.Answer;
import com.xiilab.domain.Question;

public interface AnswerRepository extends JpaRepository<Answer, Long> {
	
	List<Answer> findAnswerByQuestion(Question question);
}
