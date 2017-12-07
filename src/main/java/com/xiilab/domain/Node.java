package com.xiilab.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@Entity
@ToString(exclude="relationalDiagram")
@Table(name = "tbl_node")
@EqualsAndHashCode(of = "nno")
public class Node {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long nno;
	private int ouno;
	private int parentno;
	private String value;
	private int level;
	
	
	
}
