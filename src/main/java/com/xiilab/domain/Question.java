package com.xiilab.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@Table(name = "tbl_question")
@ToString(exclude="questionnaire")
@EqualsAndHashCode(of = "qno")
public  class Question {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long qno;
	
	private int pno;
	private int questionno;
	
	private String text;
	
	@Column(nullable=false, columnDefinition="varchar(16) DEFAULT '#000000'")
	private String bgcolor="#000000";
	 
	@Column(nullable=false, columnDefinition="tinyint(1) default 0")
	private Boolean isOblique= false;
	
	@Column(nullable=false, columnDefinition="tinyint(1) default 0")
	private Boolean isUnderline= false;
	
	@Column(nullable=false, columnDefinition="tinyint(1) default 0")
	private Boolean isRequired= false;
	
	@Column(nullable=false, columnDefinition="tinyint(1) default 0")
	private Boolean isBold= false;
	
	@Enumerated(EnumType.STRING)
	private QuestionType type;
	  
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY, orphanRemoval = true)
	@JoinColumn(name="qno")
	private List<ObjectiveItem> objectiveItems;
	
	
	
}
