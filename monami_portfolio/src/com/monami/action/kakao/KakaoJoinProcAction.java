package com.monami.action.kakao;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.RoleType;
import com.monami.model.Users;
import com.monami.repository.UsersRepository;
import com.monami.util.Script;

public class KakaoJoinProcAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 0. 유효성 검사
		if
		(
				request.getParameter("username") == null|| // 값이 X
				request.getParameter("username").equals("")|| // 공백
				request.getParameter("email") == null|| // 값이 X
				request.getParameter("email").equals("")|| // 공백
				request.getParameter("phonenumber") == null|| // 값이 X
				request.getParameter("phonenumber").equals("")|| // 공백
				request.getParameter("address") == null ||
				request.getParameter("address").equals("")

		) {
			Script.getMessage("비정상적 접근", response);
			return; // 위의 사항 중 하나라도 해당되면 아예 실행이 안되게 설정
		}

		// 1. 파라메터 받기 (x-www-form-urlencoded 라는 MIME타입 key=value)
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("tel") +"_"+ request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String userRole = RoleType.USER.toString();

		// 2. User 오브젝트 변환
		Users user = Users.builder()
				.username(username)
				.password(UUID.randomUUID().toString())
				.email(email)
				.phonenumber(phonenumber)
				.address(address)
				.userRole(userRole)
				.build();

		// 3. DB연결 - UsersRepository의 save() 호출
		UsersRepository usersRepository = UsersRepository.getInstance();
		int result = usersRepository.join(user);

		// 4. index.jsp 페이지로 이동
		if(result == 1) {
			Script.href("회원가입에 성공하였습니다.", "/monami/users?cmd=login", response);
		}else {
			Script.back("회원가입에 실패하였습니다.", response);
		}
	}

}
