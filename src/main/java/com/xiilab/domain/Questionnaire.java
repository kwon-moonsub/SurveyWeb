package com.xiilab.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
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
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@ToString(exclude={"member","questions", "respondents"})
@Table(name = "tbl_questionnaire")
@EqualsAndHashCode(of = "qnno")
public class Questionnaire{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long qnno;
	 
	@Column(nullable=false)
	private String subject;
	@Column(nullable=false)
	private String qpw;
	
	

	@Column(columnDefinition="tinyint(1) default 0")
	private Boolean post;
	@Column(nullable=true)
	private LocalDateTime postdate;
	
	@Column(nullable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private LocalDateTime stdate;
	
	
	@Column(nullable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private LocalDateTime endate;
	
	
	private String overview;
	private String url;
	
	@Column(nullable=false)
	@CreationTimestamp
	private LocalDateTime regdate;
	
	@Column(nullable=false)
	@CreationTimestamp
	private LocalDateTime updatedate;
	
	@JsonIgnore
	@ManyToOne(fetch=FetchType.LAZY)
	private Member member;
	
	@OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY, orphanRemoval = true)
	@JoinColumn(name ="qnno")
	private List<Question> questions = new ArrayList<>();
	
	@JsonIgnore
	@OneToMany(mappedBy="questionnaire", cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Respondent> respondents = new ArrayList<>();
	
	
	@ManyToOne
	@JoinColumn(name = "rdno")
	private RelationalDiagram relationDiagram;
	
	public void setQuestions(List<Question> questions){
		
		this.questions.clear();
		this.questions.addAll(questions);
	}
	
	public Questionnaire(){
		
	}


	/**
	 * @param qnno
	 * @param subject
	 * @param post
	 * @param postdate
	 * @param save
	 * @param stdate
	 * @param endate
	 * @param overview
	 * @param url
	 * @param regdate
	 * @param updatedate
	 */
	public Questionnaire(Long qnno, String subject, Boolean post, LocalDateTime postdate, 
			LocalDateTime stdate, LocalDateTime endate, String overview, String url, LocalDateTime regdate,
			LocalDateTime updatedate) {
		super();
		this.qnno = qnno;
		this.subject = subject;
		this.post = post;
		this.postdate = postdate;
		this.stdate = stdate;
		this.endate = endate;
		this.overview = overview;
		this.url = url;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}


	

	 
}
