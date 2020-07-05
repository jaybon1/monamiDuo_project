package com.monami.action.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Classes;
import com.monami.repository.ClassesRepository;

public class ClassHomeAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 전체 아이템 뿌리는 액션
		ClassesRepository classesRepository = ClassesRepository.getInstance();
		List<Classes> classes = classesRepository.find20ClassItemsByPage(0);
		
		request.setAttribute("classes",classes);
		
		RequestDispatcher dis = request.getRequestDispatcher("class.jsp");
		dis.forward(request, response);

	}

}
