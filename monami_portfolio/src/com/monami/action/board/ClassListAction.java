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
import com.monami.model.Classes;
import com.monami.model.Items;
import com.monami.repository.ClassesRepository;
import com.monami.repository.ItemsRepository;


public class ClassListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int page = Integer.parseInt(request.getParameter("page"));
		
		ClassesRepository classesRepository = ClassesRepository.getInstance();
		List<Classes> classes = classesRepository.find20ClassItemsByPage(page); // 아이템 전체출력
		
		Gson gson = new Gson();
		String classList = gson.toJson(classes);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("aplication/json; charser=utf-8");
		PrintWriter out = response.getWriter(); //bufferedWriter랑 똑같은데 autoFlush(), println() 추가
		out.println(classList);

		
	}

}
