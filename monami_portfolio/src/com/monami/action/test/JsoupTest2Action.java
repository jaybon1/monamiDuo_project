package com.monami.action.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;
import com.monami.test.JsoupTest;
import com.monami.test.JsoupTest2;
import com.monami.util.Script;

public class JsoupTest2Action implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		String url = request.getParameter("url");
//		String value = request.getParameter("value");
//		
//		List<Items> items = JsoupTest.JsoupItems(url);
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		
		for (int i = 4200; i < 7000; i++) {
			String num = (10000+i+" ");
			num = num.substring(num.length() - 5, num.length()-1);
			Items item = JsoupTest2.JsoupItems("https://www.monamimall.com/w/product/productDetail.do?goodsNo=MG00000"+num);
			System.out.println(num);
			System.out.println(item.toString());
			if(item.getName() != null && !item.getName().equals("")) {
				itemsRepository.insertItem(item);
			}
		}
		
		
//		for (int i = 0; i < 4001; i++) {
//			
//		}
//		
//		
//		for (Items item : items) {
//			int result = itemsRepository.insertItem(item, value);
//			if(result != 1) {
//				Script.getMessage("정상적인 입력에 실패하였습니다.", response);
//				return;
//			}
//		}
//		
//		Script.getMessage("입력성공", response);
	}
}
