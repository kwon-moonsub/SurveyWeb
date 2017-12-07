package com.xiilab.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode(of={"qno", "ino"})
@Embeddable
public class ObjectiveItemNo implements Serializable {
	private QuestionNo qno;
	@Column(name = "ino")
	private Long ino;
	
}
