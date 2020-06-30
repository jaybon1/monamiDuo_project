package com.monami.action.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.model.Users;
import com.monami.repository.ItemsRepository;
import com.monami.util.Script;

public class AdminProductAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Users user = (Users)session.getAttribute("principal");
		if(!user.getUserRole().equals("ADMIN")) {
			
			Script.getMessage("잘못된 접근입니다.", response);
			
		} else {
			
			int page = Integer.parseInt(request.getParameter("page"));
			
			ItemsRepository itemsRepository = ItemsRepository.getInstance();
			List<Items> itemList = itemsRepository.find20ItemsByPage(page);
			
			request.setAttribute("itemList", itemList);
			request.setAttribute("page", page);
			request.setAttribute("listSize", itemList.size());
			
			RequestDispatcher dis = request.getRequestDispatcher("admin/adminProduct.jsp");
			dis.forward(request, response);
			
		}
	}
}
