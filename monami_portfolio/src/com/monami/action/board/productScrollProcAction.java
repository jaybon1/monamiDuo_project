package com.monami.action.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;

public class ProductScrollProcAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listAmount = Integer.parseInt(request.getParameter("listAmount"));
		String part = request.getParameter("part");
		
		List<Items> itemss = null;
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		if(part.equals("all")) {
			itemss = itemsRepository.find20ItemsByPage(listAmount);
		} else {
			itemss = itemsRepository.find20ItemsByPage(listAmount, part);	
		}
		
		
		Gson gson = new Gson();
		String itemsList = gson.toJson(itemss);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter(); //bufferedWriter랑 똑같은데 autoFlush(), println() 추가
		out.println(itemsList);
		
		// request.setAttribute("itemss",itemss);
		// ajax는 데이터를 받으니까 dispatcher가 필요 없음
	}
}
