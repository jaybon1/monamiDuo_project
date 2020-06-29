package com.monami.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.repository.ItemsRepository;
import com.monami.util.Script;

public class AdminProductDeleteProcAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		int result = itemsRepository.deleteById(id);
		
		if(result == 1) {
			
			Script.href("삭제에 성공하였습니다.", "/monami/admin?cmd=product&page="+page, response);
			
		} else {
			
			Script.back("삭제에 실패했습니다.", response);
			
		}
	}
}
