package com.xiilab.domain;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@ToString
@Table(name = "tbl_child")
public class Child {
	@EmbeddedId
	private ChildId id;
	 
	private String name;
	
	@ManyToOne
	@MapsId("parentId")
	@JoinColumn(name="PARENT_ID")
	Parent parent;
	
}
