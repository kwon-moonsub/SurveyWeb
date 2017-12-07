package com.xiilab.domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.java.Log;

@Log
@Getter
@Setter
@Entity
@ToString(exclude="children")
@Table(name = "tbl_parent")
@EqualsAndHashCode(of = "id")
public class Parent {
	@Id @Column(name = "PARENT_ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	 
	private String name;
	
	@OneToMany(mappedBy = "parent", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
   	private Collection<Child> children = new ArrayList<>();
	
	public void addChild(Child child){
		if(child != null){
			children.add(child);
			child.setParent(this);
		}
		
	}
	
}
