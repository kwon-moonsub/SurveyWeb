package com.xiilab.domain;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of={"qnno", "qno"})
@Embeddable
public class QuestionNo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5666573845402151268L;
	private Long qnno;
	private Long qno;
}
