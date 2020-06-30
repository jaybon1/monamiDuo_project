package com.monami.action.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;

public class AdminProductUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
//		int page = Integer.parseInt(request.getParameter("page"));
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		Items item = itemsRepository.findById(id);
		
		request.setAttribute("item", item);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/adminProductUpdate.jsp");
		rd.forward(request, response);

	}
}
