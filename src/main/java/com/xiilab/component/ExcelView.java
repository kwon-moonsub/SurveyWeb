package com.xiilab.component;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.xiilab.domain.Node;
import com.xiilab.domain.ObjectiveItem;
import com.xiilab.domain.Question;
import com.xiilab.domain.QuestionType;

import lombok.extern.java.Log;

@Component
@Log
public class ExcelView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	
		Sheet sheet = workbook.createSheet();
		
			
		List<Map> result = (List<Map>)model.get("result");
		
		int rownum = 0;
		Row row = null;
		Cell cell= null;
		for(int i = 0 ; i < result.size() ; i++){
			Map map = result.get(i);
			Question question = (Question)map.get("question");
			QuestionType type = question.getType();
			
			row = sheet.createRow(rownum);
			cell = row.createCell(0);
			
			cell.setCellValue(question.getQuestionno() + ". " + question.getText());
			
			
			List<Map> answers = (List<Map>)map.get("answers");
			for(int j = 0 ; j < answers.size() ; j++){
				Map answer = answers.get(j);
				rownum ++;
				row = sheet.createRow(rownum);
				cell = row.createCell(1);
				if(type ==QuestionType.OBJECTIVE ){
					
					ObjectiveItem item = (ObjectiveItem)answer.get("item");
					cell.setCellValue((j + 1) + ") " + item.getText());
					cell = row.createCell(2);
					cell.setCellValue("선택 명수 : " + answer.get("count"));
				}else if(type == QuestionType.SUBJECTIVE){
					
					cell.setCellValue((j + 1) + ") " + answer.get("text"));
					
				}else if(type == QuestionType.RELATIONALOBJECTIVE){
					Node source = (Node)answer.get("source");
					Node target = (Node)answer.get("target");
					List<Map> items = (List<Map>)answer.get("items");
					
					cell.setCellValue((j + 1) + ") " + source.getValue() + " --> " + target.getValue());
					
					for(int k = 0 ; k < items.size() ; k++){
						Map item = items.get(k);
						
						ObjectiveItem objectiveItem = (ObjectiveItem)item.get("item");
						cell = row.createCell(k + 2);
						
						
						cell.setCellValue((k + 1) + ") " + objectiveItem.getText() + ", 선택 개수 : " + item.get("count"));
					}
					
					
					//cell.setCellValue((j + 1) + ") " + answer.getSource().getValue() + " --> " + answer.getTarget().getValue() + " : " + answer.getItems().get(0).getText());
					
				}else if(type == QuestionType.RELATIONALSUBJECTIVE){
					Node source = (Node)answer.get("source");
					Node target = (Node)answer.get("target");
					List<Map> items = (List<Map>)answer.get("items");
					
					cell.setCellValue((j + 1) + ") " + source.getValue() + " --> " + target.getValue());
					
					cell = row.createCell(2);
					cell.setCellValue((String)answer.get("text"));
					
					//cell.setCellValue((j + 1) + ") " + answer.getSource().getValue() + " --> " + answer.getTarget().getValue() + " : " + answer.getText());
					
					
				}
			}
		
			
			rownum += 2;
			
		}
		
		
		
		
		response.setContentType("Application/Msexcel"); 
		response.setHeader("Content-Disposition", "ATTachment; Filename=survey-excel.xls");
	}
	
	private void makeCellWithStyle(HSSFRow row, int index, HSSFCellStyle style, String value){
		HSSFCell cell = row.createCell(index);
		cell.setCellStyle(style);
		cell.setCellValue(value);
	}

}
