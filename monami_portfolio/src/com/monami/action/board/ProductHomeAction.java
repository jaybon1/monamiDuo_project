package com.monami.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;


public class ProductHomeAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		List<Items> itemss = itemsRepository.findAllItems();
		
		request.setAttribute("itemss",itemss);

		RequestDispatcher dis = request.getRequestDispatcher("product.jsp");
		dis.forward(request, response);

	}

}
