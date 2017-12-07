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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@ToString(exclude={"questionnaires","relationalDiagram"})
@Table(name = "tbl_member")
@EqualsAndHashCode(of = "mno")
public class Member {
	 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mno;
	
	@Column(unique = true, nullable=false)
	@Pattern(regexp="^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$" ,message="올바른 이메일을 입력하세요.")
	private String email;
	
	
	@Column(nullable=false)
	@Size(min=5, max=10, message="이름의 길이를 확인하세요")
	private String name;
	@Column(nullable=false)
	private String mpw;
	
	@CreationTimestamp
	@Column(nullable=false)
	private LocalDateTime regdate; 
	@CreationTimestamp
	@Column(nullable=false)
	private LocalDateTime updatedate;
	 
	@JsonIgnore
	@OneToMany(mappedBy="member", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Questionnaire> questionnaires;
	
	@JsonIgnore
	@OneToMany(mappedBy="member", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<RelationalDiagram> relationalDiagram;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name = "member")
	private List<MemberRole> roles;
	
}
