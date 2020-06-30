package com.monami.action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;


public class ProductListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String value = request.getParameter("value");
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		List<Items> itemss = itemsRepository.find20ItemsByPage(0, value); // 처음 뿌려줄 거니까 0 으로 시작
		
		
		Gson gson = new Gson();
		String itemssJson = gson.toJson(itemss);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("aplication/json; charser=utf-8");
		PrintWriter out = response.getWriter(); //bufferedWriter랑 똑같은데 autoFlush(), println() 추가
		out.println(itemssJson);

	}

}
