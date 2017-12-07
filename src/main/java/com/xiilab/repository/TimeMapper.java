package com.xiilab.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	@Select("select now()")
	public String getTime();
	
	public String getTimeXML();
	
	public List<Map> getQuestionnaireList(Map map);
}
