package com.monami.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;
import com.monami.util.Script;

public class AdminProductInputProcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String imgUrl;
		String name;
		String price;
		String value;
		String bodyColor;
		String inkColor;
		String productSpec;
		String charac;
		String mainCharac;
		String detailImgUrl;
		
		Items item = Items.builder()
				.imgUrl(imgUrl)
				.name(name)
				.price(price)
				.value(value)
				.bodyColor(bodyColor)
				.inkColor(inkColor)
				.productSpec(productSpec)
				.charac(mainCharac)
				.mainCharac(mainCharac)
				.detailImgUrl(detailImgUrl)
				.build();
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		int result = itemsRepository.insertItem(item);
		
		if(result == 1) {
			Script.href("등록에 성공하였습니다.", uri, response);
		} else {
			Script.back("등록에 실패하였습니다.", response);
		}
		
	}
	
}
