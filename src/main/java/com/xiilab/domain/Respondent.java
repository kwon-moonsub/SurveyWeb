package com.xiilab.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tbl_respondent")
@EqualsAndHashCode(of = "resno")
public class Respondent {
	 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long rno;
	
	@ManyToOne
	@JoinColumn(name="qnno")
	Questionnaire questionnaire;
	
	private String ipAddress;
	 
	@Column(nullable=false)
	@CreationTimestamp
	private LocalDateTime regdate;
	 
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY, orphanRemoval = true)
	@JoinColumn(name="rno")
	private List<Answer> answers;
}
