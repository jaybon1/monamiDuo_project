package com.monami.action.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.dto.BodyColor;
import com.monami.dto.CartDto;
import com.monami.dto.InkColor;
import com.monami.dto.ItemDetailDto;
import com.monami.dto.ProductSpec;
import com.monami.model.Cart;
import com.monami.model.Items;
import com.monami.repository.CartRepository;
import com.monami.repository.ItemsRepository;
import com.monami.util.Script;

public class CartProcAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		
		Cart cart = Cart.builder()
				.userId(userId)
				.itemId(itemId)
				.amount(amount)
				.build();
		
		
		CartRepository cartRepository = CartRepository.getInstance();
		int result = cartRepository.insertCartItem(cart);
		
		if(result == 1) {
			// 장바구니 수량 증가 (빨간 동그라미)
			List<CartDto> cartDtos = cartRepository.findCartDtoListById(userId);
			HttpSession session = request.getSession();
			session.setAttribute("cartDtos", cartDtos); 
			Script.href("장바구니로 이동", "/monami/users?cmd=cart", response);
			Script.href("장바구니로 이동", "/monami/users?cmd=cart", response);
		}else {
			Script.back("다시 선택해주세요", response);
		}
	}
}
