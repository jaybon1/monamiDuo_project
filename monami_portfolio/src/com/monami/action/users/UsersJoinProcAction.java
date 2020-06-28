package com.monami.action.users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.RoleType;
import com.monami.model.Users;
import com.monami.repository.UsersRepository;
import com.monami.util.SHA256;
import com.monami.util.Script;


// join 실행파일
public class UsersJoinProcAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 0. 유효성 검사
		if
		(
				request.getParameter("username") == null|| // 값이 X
				request.getParameter("username").equals("")|| // 공백
				request.getParameter("password") == null||
				request.getParameter("password").equals("")||
				request.getParameter("email") == null ||
				request.getParameter("email").equals("")||
				request.getParameter("address") == null||
				request.getParameter("address").equals("")
				
		) {
			return; // 위의 사항 중 하나라도 해당되면 아예 실행이 안되게 설정
		}
		
		// 카카오 아이디와 구분하기 위해 회원가입시 _를 받지 않는다.
		if(request.getParameter("username").contains("_")) {
			Script.back("회원 아이디에 _를 넣을 수 없습니다.", response);
			return;
		}
		
		// 1. parameter 받기 (X-www.form-urlencoded 라는 MIME 타입 key=value)
		String username = request.getParameter("username");
		String rawpassword = request.getParameter("password");
		String password = SHA256.encodeSha256(rawpassword);
		String phonenumber =request.getParameter("phonenumber");
		String email = request.getParameter("email"); // e-mail 형식에 대한 유효성 검사도 시행해줘야함
		String address = request.getParameter("address");
//		String roadFullAddr = request.getParameter("roadFullAddr");
		String userRole = RoleType.USER.toString(); // 마음대로 넣는 걸 방지하기 위해 enum으로 설정
		
		// 2. User 오브젝트 변환
		Users user = Users.builder()
				.username(username)
				.password(password)
				.phonenumber(phonenumber)
				.email(email)
				.address(address)
				.userRole(userRole)
				.build();
		
		// 3. DB연결 - UserRepository의 save() 호출
		UsersRepository userRepository = UsersRepository.getInstance();
		int result = userRepository.join(user);
		
		
		// 4. index.jsp 페이지로 이동
		if(result == 1) {
			Script.href("회원가입에 성공하였습니다.", "/monami/users?cmd=login", response);
		}else {
			Script.back("회원가입에 실패하였습니다.", response);
		}
		
	}
}
