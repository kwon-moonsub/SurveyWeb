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
@EqualsAndHashCode(of = {"parentId","childId"})
@Embeddable
public class ChildId implements Serializable {

	private Long parentId;
	private Long childId;
}
