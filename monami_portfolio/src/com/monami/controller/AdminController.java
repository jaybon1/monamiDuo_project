package com.monami.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.admin.AdminProductAction;
import com.monami.action.admin.AdminProductDeleteProcAction;
import com.monami.action.admin.AdminProductInputProcAction;
import com.monami.action.admin.AdminProductUpdateProcAction;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private final static String TAG = "UsersController : ";
	private static final long serialVersionUID = 1L;

	public AdminController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// http://localhost:8000/blog/user?cmd=join
		String cmd = request.getParameter("cmd");
		System.out.println(TAG + "router : " + cmd);
		Action action = router(cmd);
		action.execute(request, response);
	}

	public Action router(String cmd) {
		if (cmd.equals("product")) {
			// 회원가입 페이지로 이동
			return new AdminProductAction();
		} else if (cmd.equals("productInputProc")) {
			// 회원가입 페이지로 이동
			return new AdminProductInputProcAction();
		} else if (cmd.equals("productUpdateProc")) {
			// 회원가입 페이지로 이동
			return new AdminProductUpdateProcAction();
		} else if (cmd.equals("productDeleteProc")) {
			// 회원가입 페이지로 이동
			return new AdminProductDeleteProcAction();
		}
		
		return null;
	}
}
