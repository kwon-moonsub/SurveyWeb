package com.xiilab.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.web.multipart.MultipartFile;

import com.xiilab.domain.Node;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Getter
@Setter
public class ExcelManager {
	private Workbook wb;
	
	public ExcelManager(MultipartFile excelFile) {
		// TODO Auto-generated constructor stub
		log.info(excelFile.getOriginalFilename().toUpperCase());
		boolean isXLS = excelFile.getOriginalFilename().toUpperCase().endsWith(".XLS");
		boolean isXLSX = excelFile.getOriginalFilename().toUpperCase().endsWith(".XLSX");
		
		if(isXLS || isXLSX){
			 try {
	            	
	            	InputStream fis = new ByteArrayInputStream(excelFile.getBytes());
	            	this.wb = WorkbookFactory.create(fis);
	                
	            } catch (IOException | EncryptedDocumentException | InvalidFormatException e) {
	                throw new RuntimeException(e.getMessage(), e);
	            }
		}
		
	}
	
	public String getSheetName(){
		Sheet sheet = this.wb.getSheetAt(0);
		return sheet.getSheetName();
	}
	
	
	public List<Node> makeNodeTree(){
		List<Node> nodes = new ArrayList<>();
		this.makeNode(nodes, 0, 0, 1, 1, 0);
		return nodes;
	}
	
	private Map makeNode(List<Node> nodes, int row, int column, int ouno, int level, int parentno){
		
		log.info("row : " + row + "\t" + "column : " + column + "\t" + "ouno : " + ouno + "level : " + level + "\t" + "parentno : " + parentno);
		Sheet sheet = this.wb.getSheetAt(0);
		Cell cell;
		if(this.checkValidCell(sheet, row, column)){
			cell = sheet.getRow(row).getCell(column);
		}else{
			cell = null;
		}
		
		
		while(cell != null){
			Node node = new Node();
			node.setValue(cell.getStringCellValue());
			node.setOuno(ouno);
			node.setLevel(level);
			node.setParentno(parentno);
			log.info("value : " + node.getValue() + "\t" + "ouno : " + node.getOuno() + "\t" + "level : " +  node.getLevel() + "\t" + "parentno : " + node.getParentno());
			nodes.add(node);
			
			Map result = makeNode(nodes, row + 1, column + 1, ouno + 1, level + 1, ouno);
			
			row = (int)result.get("row");
			ouno = (int)result.get("ouno");
			
			if(this.checkValidCell(sheet, row, column)){
				cell = sheet.getRow(row).getCell(column);
			}else{
				cell = null;
			}
			
		}
		
		Map map = new HashMap();
		map.put("row", row);
		map.put("ouno", ouno);
		
		return map;
		
		/*
		Iterator<Row> rows = sheet.rowIterator();
		
		while(rows.hasNext()){
			
			Row row = rows.next();
			int rowNum = row.getRowNum();
			Iterator<Cell> cells = row.cellIterator();
			while(cells.hasNext()){
				Cell cell= cells.next();
				int columnNum = cell.getColumnIndex();
				log.info(rowNum + "," + columnNum);
				log.info(cell.getStringCellValue());
			}
		}
		*/
	}
	
	private boolean checkValidCell(Sheet sheet, int row, int column){
		boolean result = false;
		
		if(row <= sheet.getLastRowNum()){
			Row cellRow = sheet.getRow(row);
			if(cellRow != null && column <= cellRow.getLastCellNum()){
				result = true;
			}
				
		}
		return result;
	}
}
