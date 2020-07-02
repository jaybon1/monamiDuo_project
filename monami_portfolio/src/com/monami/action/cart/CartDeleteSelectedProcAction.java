package com.monami.action.cart;

import java.io.BufferedReader;
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

public class CartDeleteSelectedProcAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		BufferedReader br = request.getReader();
		
		String checkedCartIdList = br.readLine();
		System.out.println(checkedCartIdList);
		
		CartRepository cartRepository = CartRepository.getInstance();
		
		int result = cartRepository.deleteCartItems(checkedCartIdList);
		
		if(result > 0) {
			
			List<CartDto> cartDtos = cartRepository.findCartDtoListById(userId);
			HttpSession session = request.getSession();
			session.setAttribute("cartDtos", cartDtos);
			
			Script.href("삭제에 성공하였습니다.", "/monami/users?cmd=cart", response);
		} else {
			Script.back("삭제에 실패하였습니다.", response);
		}

	}
}
