package com.jsp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.jsp.dto.PFileVO;

public class MakeFileName {
	
	
	public static String toUUIDFileName(String fileName, String delimiter) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + delimiter + fileName;
	}
	
	public static String parseFileNameFromUUID(String fileName,
				String delimiter) {
		String[] uuidFileName = fileName.split(delimiter);
		return uuidFileName[uuidFileName.length - 1];
	}
	
	public static List<PFileVO> parseFileNameFromAttaches(List<PFileVO> pfileList, String delimiter){
		List<PFileVO> renamedPfileList = new ArrayList<PFileVO>();
		
		if(pfileList != null) {
			for(PFileVO pfile : pfileList) {
				String fileName = pfile.getFilename();
				fileName = parseFileNameFromUUID(fileName, delimiter);
				
				pfile.setFilename(fileName);
				
				renamedPfileList.add(pfile);
			}
		}
		
		return renamedPfileList;
	}
}









