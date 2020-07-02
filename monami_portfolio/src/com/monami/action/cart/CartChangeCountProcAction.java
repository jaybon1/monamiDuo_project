package com.monami.action.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.dto.CartDto;
import com.monami.repository.CartRepository;

public class CartChangeCountProcAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int amount = Integer.parseInt(request.getParameter("amount"));
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		CartRepository cartRepository = CartRepository.getInstance();
		
		int result = cartRepository.updateCartCount(amount, cartId);
		
		if(result == 1) {
			
			List<CartDto> cartDtos = cartRepository.findCartDtoListById(userId);
			HttpSession session = request.getSession();
			session.setAttribute("cartDtos", cartDtos);
			
		}
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		pw.println(result+"");
		
	}
}
