package com.monami.action.users;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.monami.action.Action;
import com.monami.dto.CartDto;
import com.monami.model.Users;
import com.monami.repository.CartRepository;
import com.monami.repository.UsersRepository;
import com.monami.util.SHA256;
import com.monami.util.Script;


public class UsersLoginProcAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RequestDispatcher dis = request.getRequestDispatcher("user/join.jsp");
//		dis.forward(request, response);

		if
		(
				request.getParameter("username").equals("")|| // 공백
				request.getParameter("username") == null|| // 값이 X
				request.getParameter("password").equals("")||
				request.getParameter("password") == null
		) {
			return; // 위의 사항 중 하나라도 해당되면 아예 실행이 안되게 설정
		}
		String username = request.getParameter("username");
		String rawPassword = request.getParameter("password");
		String password = SHA256.encodeSha256(rawPassword);
		UsersRepository userRepository = UsersRepository.getInstance();
		Users user = userRepository.findByUsernameAndPassword(username, password);
		
		if(user != null) {
			//로그인 성공 (세션은 request가 들고 있음)
			HttpSession session = request.getSession();
			
			//장바구니 가져오기
			int userId = user.getId();
			
			CartRepository cartRepository = CartRepository.getInstance();
			List<CartDto> cartDtos = cartRepository.findCartDtoListById(userId);
			
			
			session.setAttribute("principal", user); // 인증 주체
			session.setAttribute("cartDtos", cartDtos);
			
			if(request.getParameter("remember") != null) {

				// key => Set-Cookie
				// value => remember=ssar
				
				//null이 아니면 무조건 on이 날라감
				Cookie cookie = new Cookie("remember", user.getUsername());
				response.addCookie(cookie);
				//reponse.setHeader("Ser-Cookie", "remeber=ssar");
			}else {
				Cookie cookie = new Cookie("remember", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			Script.href("로그인 성공", "/monami/about.jsp",response);
			
		}else {
			Script.back("로그인 실패", response);
		}

	}

}
