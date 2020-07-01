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
import com.monami.action.admin.AdminProductInputAction;
import com.monami.action.admin.AdminProductInputProcAction;
import com.monami.action.admin.AdminProductSearchProcAction;
import com.monami.action.admin.AdminProductUpdateAction;
import com.monami.action.admin.AdminProductUpdateProcAction;
import com.monami.action.admin.AdminUsersAction;
import com.monami.action.admin.AdminUsersChangeRoleProcAction;
import com.monami.action.admin.AdminUsersSearchProcAction;
@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private final static String TAG = "AdminController : ";
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
		} else if (cmd.equals("productInput")) {
			// 회원가입 페이지로 이동
			return new AdminProductInputAction();
		} else if (cmd.equals("productInputProc")) {
			// 회원가입 페이지로 이동
			return new AdminProductInputProcAction();
		} else if (cmd.equals("productUpdate")) {
			// 회원가입 페이지로 이동
			return new AdminProductUpdateAction();
		} else if (cmd.equals("productUpdateProc")) {
			// 회원가입 페이지로 이동
			return new AdminProductUpdateProcAction();
		} else if (cmd.equals("productDeleteProc")) {
			// 회원가입 페이지로 이동
			return new AdminProductDeleteProcAction();
		} else if (cmd.equals("productSearchProc")) {
			// 회원가입 페이지로 이동
			return new AdminProductSearchProcAction();
		} else if (cmd.equals("users")) {
			// 회원가입 페이지로 이동
			return new AdminUsersAction();
		} else if (cmd.equals("usersSearchProc")) {
			// 회원가입 페이지로 이동
			return new AdminUsersSearchProcAction();
		} else if (cmd.equals("usersChangeRoleProc")) {
			// 회원가입 페이지로 이동
			return new AdminUsersChangeRoleProcAction();
		}
		
		return null;
	}
}
