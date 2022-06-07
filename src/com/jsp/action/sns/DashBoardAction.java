package com.jsp.action.sns;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.command.Criteria;
import com.jsp.service.PdsService;

public class DashBoardAction implements Action{

	private PdsService pdsService;
	
	public void setPdsService(PdsService pdsService) {
		this.pdsService = pdsService;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/sns/dashboard";
		
		String page = request.getParameter("page");
		String perPageNum = request.getParameter("perPageNum");
		
		try {
			Criteria cri = new Criteria();
			
			boolean criFlag = true;
			criFlag = criFlag && page != null
							  && !page.isEmpty()
							  && perPageNum != null
							  && !perPageNum.isEmpty();
			
			if(criFlag) {
				try {
					cri.setPage(Integer.parseInt(page));
					cri.setPerPageNum(Integer.parseInt(perPageNum));
				}catch(Exception e) {
					response.sendError(response.SC_BAD_REQUEST);
					return null;
				}
			}
			
			Map<String, Object> dataMap = pdsService.getImportantList(cri);
			request.setAttribute("dataMap", dataMap);
			
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return url;
	}

}
