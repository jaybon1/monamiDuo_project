package com.monami.action.users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.monami.action.Action;
import com.monami.util.Script;

public class UsersLogoutAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate(); // 세션 무효화
		// session.removeAttribute("principal"); // principal만 날리는 것
		Script.href("로그아웃 성공", "/monami/board?cmd=about", response);
	}
}
