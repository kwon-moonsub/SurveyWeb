package com.xiilab.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
@Table(name = "tbl_objective_item")
@EqualsAndHashCode(of = "ino")
public class ObjectiveItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ino;
	  
	private String text;
	private float weight;
	
	
}
