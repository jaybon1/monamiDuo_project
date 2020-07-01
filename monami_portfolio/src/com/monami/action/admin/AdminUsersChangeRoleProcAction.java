package com.monami.action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.monami.action.Action;
import com.monami.model.Users;
import com.monami.repository.UsersRepository;
import com.monami.util.Script;

public class AdminUsersChangeRoleProcAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String userRole = request.getParameter("userRole");
		String username = request.getParameter("username");
		
		UsersRepository usersRepository = UsersRepository.getInstance();
		int result = usersRepository.updateUserRole(id, userRole);
		
		if(result == 1) {
			
			List<Users> user = usersRepository.findUserByUsername(username);
			
			Gson gson = new Gson();
			String userJson = gson.toJson(user);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			PrintWriter pw = response.getWriter();
			
			pw.println(userJson);
			
		} else {
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json; charset=utf-8");
			PrintWriter pw = response.getWriter();
			
			pw.println(-1+"");
		}

	}
}
