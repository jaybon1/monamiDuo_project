package com.monami.action.admin;

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

public class AdminProductSearchProcAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		List<Items> itemList = itemsRepository.findByName(name);
		
		Gson gson = new Gson();
		String itemListJson = gson.toJson(itemList);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		pw.println(itemListJson);

	}
}
