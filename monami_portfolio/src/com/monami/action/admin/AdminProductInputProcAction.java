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
		
		String imgUrl = request.getParameter("itemsImgUrl");
		String name = request.getParameter("itemsName");
		String price = request.getParameter("itemsPrice");
		String value = request.getParameter("valuePart");
		String bodyColor = request.getParameter("itemsBodyColor");
		String inkColor = request.getParameter("itemsInkColor");
		String productSpec = request.getParameter("itemsProductSpec");
		String charac = request.getParameter("itemsCharac");
		String mainCharac = request.getParameter("itemsMainCharac");
		String detailImgUrl = request.getParameter("itemsDetailImgUrl");
		
		Items item = Items.builder()
				.imgUrl(imgUrl)
				.name(name)
				.price(price)
				.value(value)
				.bodyColor(bodyColor)
				.inkColor(inkColor)
				.productSpec(productSpec)
				.charac(charac)
				.mainCharac(mainCharac)
				.detailImgUrl(detailImgUrl)
				.build();
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		int result = itemsRepository.insertItem(item);
		
		if(result == 1) {
			Script.useScript("등록에 성공하였습니다.", "opener.location.reload(); window.close();", response);
		} else {
			Script.back("등록에 실패하였습니다.", response);
		}
		
	}
	
}
