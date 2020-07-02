package com.monami.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.action.cart.CartChangeCountProcAction;
import com.monami.action.cart.CartDeleteProcAction;
import com.monami.action.cart.CartDeleteSelectedProcAction;
import com.monami.action.cart.CartProcAction;


@WebServlet("/cart")
public class CartController extends HttpServlet {
	private final static String TAG = "CartController  : ";
	private static final long serialVersionUID = 1L;

	public CartController() {
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
		// http://localhost:8000/blog/user?cmd=detail
		String cmd = request.getParameter("cmd");
		System.out.println(TAG + "router : " + cmd);
		Action action = router(cmd);
		action.execute(request, response);
	}

	// Controller에서 파일이 생성되고, 라우터를 타면 return 값으로 객체를 생성시켜주고, action이라는 변수에 넣어주고
	// execute로 실행
	public Action router(String cmd) {
		if (cmd.equals("cartProc")) {
			return new CartProcAction();
		} else if (cmd.equals("cartDeleteProc")) {
			return new CartDeleteProcAction();
		} else if (cmd.equals("cartDeleteSelectedProc")) {
			return new CartDeleteSelectedProcAction();
		} else if (cmd.equals("changeCountProc")) {
			return new CartChangeCountProcAction();
		}
		return null;
	}
}