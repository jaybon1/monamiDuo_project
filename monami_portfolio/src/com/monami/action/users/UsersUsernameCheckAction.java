package com.monami.action.users;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Users;
import com.monami.repository.UsersRepository;
import com.monami.util.Script;

public class UsersUsernameCheckAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username"); 
		PrintWriter out = response.getWriter(); // =BufferedWriter 
		
		// result가 빈칸이면 2로 리턴
		if(username.equals("")) {
			out.print(2);
			return;
		}
		
		UsersRepository usersRepository = UsersRepository.getInstance();
//		int result = usersRepository.findByUsername(username);
		Users user = usersRepository.findUserInfoByUsername(username);
		
		if(user == null) {
			Script.outText("0", response);
		}else {
			Script.outText("1", response);
		}
		
//		Script.outText(result+"", response); //+""문자로 리턴
	}
}
