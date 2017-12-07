package com.xiilab.domain;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.CascadeType;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@Entity
@ToString(exclude="nodes")
@Table(name = "tbl_relation_diagram")
@EqualsAndHashCode(of = "rdno")
public class RelationalDiagram {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long rdno;
	
	private String name;
	
	@CreationTimestamp
	private LocalDateTime regdate;
	
	@CreationTimestamp
	private LocalDateTime updatedate;
	 
	
	@JsonIgnore
	@JoinColumn(name = "mno")
	@ManyToOne
	private Member member;
	
	public RelationalDiagram(){
		
	}
	
	

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="rdno") 
	private List<Node> nodes;
	
	/**
	 * @param rdno
	 * @param name
	 * @param regdate
	 * @param updatedate
	 */
	public RelationalDiagram(Long rdno, String name, LocalDateTime regdate, LocalDateTime updatedate) {
		super();
		this.rdno = rdno;
		this.name = name;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}
	
}
