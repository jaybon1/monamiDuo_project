package com.monami.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.users.UsersAdminAction;
import com.monami.action.users.UsersCartAction;
import com.monami.action.users.UsersJoinAction;
import com.monami.action.users.UsersJoinProcAction;
import com.monami.action.users.UsersLoginAction;
import com.monami.action.users.UsersLoginProcAction;
import com.monami.action.users.UsersLogoutAction;
import com.monami.action.users.UsersOrderAction;
import com.monami.action.users.UsersUpdateAction;
import com.monami.action.users.UsersUpdateProcAction;
import com.monami.action.users.UsersUsernameCheckAction;

@WebServlet("/users")
public class UsersController extends HttpServlet {
	private final static String TAG = "UsersController : ";
	private static final long serialVersionUID = 1L;

	public UsersController() {
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
		if (cmd.equals("join")) {
			// 회원가입 페이지로 이동
			return new UsersJoinAction();
		} else if (cmd.equals("joinProc")) {
			// 회원가입을 진행 한 후 -> index.jsp로 이동
			return new UsersJoinProcAction();
		} else if (cmd.equals("login")) {
			// 로그인 페이지로 이동
			return new UsersLoginAction();
		} else if (cmd.equals("usernameCheck")) {
			// 아이디 중복체크
			return new UsersUsernameCheckAction();
		} else if (cmd.equals("loginProc")) {
			// 회원 로그인을 수행한 후 -> 세션에 등록을 하고 -> index.jsp로 이동
			return new UsersLoginProcAction();
		} else if (cmd.equals("logout")) {
			// 로그아웃
			return new UsersLogoutAction();
		} else if (cmd.equals("update")) {
			// 수정페이지로 이동
			return new UsersUpdateAction();
		}else if(cmd.equals("updateProc")) {
			// 수정페이지로 이동헤서 작업
			return new UsersUpdateProcAction();
		}else if(cmd.equals("order")) {
			// 주문관리 페이지 이동
			return new UsersOrderAction();
		}else if(cmd.equals("cart")) {
			// 장바구니 페이지 이동 
			return new UsersCartAction();
		}else if(cmd.equals("admin")) {
			// 관리자 페이지로 이동
			return new UsersAdminAction();
		}
		
		return null;
	}
}
