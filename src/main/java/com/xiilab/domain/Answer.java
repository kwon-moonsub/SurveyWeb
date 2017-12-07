package com.xiilab.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "tbl_answer")
@EqualsAndHashCode(of = "ano")
public class Answer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ano;
	
	private String text;
	
	@Enumerated(EnumType.STRING)
	private QuestionType type;
	
	@ManyToOne
	@JoinColumn(name="source_node_no")
	private Node source;
	
	@ManyToOne
	@JoinColumn(name="target_node_no")
	private Node target;
	
	@ManyToOne
	@JoinColumn(name="qno")
	@JsonProperty(access = Access.WRITE_ONLY)
	Question question;
	
	@ManyToMany
	@JoinTable(name = "tbl_answer_item",
			joinColumns = @JoinColumn(name = "ano"),
			inverseJoinColumns = @JoinColumn(name = "oino"))
	private List<ObjectiveItem> items = new ArrayList<>();
	
	
	
}
