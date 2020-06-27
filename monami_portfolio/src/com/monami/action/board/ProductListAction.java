package com.monami.action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;


public class ProductListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String value = request.getParameter("value");
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		List<Items> itemss = itemsRepository.findByItem(value);
		
		request.setAttribute("itemss",itemss);
		System.out.println(itemss.get(0).getValue());

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); //bufferedWriter랑 똑같은데 autoFlush(), println() 추가
		out.println(itemss);

	}

}
