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

		ClassesRepository classesRepository = ClassesRepository.getInstance();
		List<Classes> classes = classesRepository.findAllClassItems();
		
		request.setAttribute("classes",classes);
		
		RequestDispatcher dis = request.getRequestDispatcher("class.jsp");
		dis.forward(request, response);

	}

}
