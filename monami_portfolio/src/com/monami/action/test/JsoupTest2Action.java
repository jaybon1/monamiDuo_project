package com.monami.action.test;

import java.io.IOException;
import java.util.ArrayList;
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
		
		for (int i = 2501; i < 7000; i=i+50) {
			
			
			List<Items> itemList = new ArrayList<>();
			
			for (int j = 1; j < 51; j++) {
				
				final String num = (10000+i+j+"").substring((10000+i+j+"").length() - 4, (10000+i+j+"").length());
				System.out.println(num);
				
				new Thread(new Runnable() {
					
					@Override
					public void run() {
						
						
						Items item = JsoupTest2.JsoupItems("https://www.monamimall.com/w/product/productDetail.do?goodsNo=MG00000"+num);
						System.out.println(item.toString());
						itemList.add(item);
						
					}
				}).start();
				
			}
			
			while (true) {
				if (itemList.size()>49) {
					break;
				}
				try {
					Thread.sleep(100);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			for (Items item : itemList) {
				if(item.getName() != null && !item.getName().equals("")) {
					itemsRepository.insertItem(item);
				}
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
