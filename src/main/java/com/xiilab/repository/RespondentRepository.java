package com.xiilab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.xiilab.domain.Respondent;

public interface RespondentRepository extends JpaRepository<Respondent, Long> {
	
}
