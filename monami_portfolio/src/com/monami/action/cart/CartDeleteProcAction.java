package com.monami.action.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.dto.CartDto;
import com.monami.repository.CartRepository;
import com.monami.util.Script;

public class CartDeleteProcAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		CartRepository cartRepository = CartRepository.getInstance();
		
		int result = cartRepository.deleteCartItem(cartId);
		
		if(result == 1) {
			
			List<CartDto> cartDtos = cartRepository.findCartDtoListById(userId);
			HttpSession session = request.getSession();
			session.setAttribute("cartDtos", cartDtos);
			
			Script.href("삭제에 성공하였습니다.", "/monami/users?cmd=cart", response);
		} else {
			Script.back("삭제에 실패하였습니다.", response);
		}

	}
}
