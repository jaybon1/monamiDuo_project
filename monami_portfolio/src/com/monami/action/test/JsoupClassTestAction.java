package com.monami.action.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Classes;
import com.monami.model.Items;
import com.monami.repository.ClassesRepository;
import com.monami.repository.ItemsRepository;
import com.monami.test.JsoupClassTest;
import com.monami.test.JsoupTest;
import com.monami.util.Script;

public class JsoupClassTestAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = request.getParameter("url");
		
		List<Classes> classes = JsoupClassTest.JsoupClass(url);
		
		ClassesRepository classesRepository = ClassesRepository.getInstance();
		
		for (Classes class1 : classes) {
			int result = classesRepository.insertClassItem(class1);
			if(result != 1) {
				Script.getMessage("정상적인 입력에 실패하였습니다.", response);
				return;
			}
		}
		
		Script.getMessage("입력성공", response);
	}
}
