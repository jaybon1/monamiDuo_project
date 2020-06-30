package com.monami.action.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;
import com.monami.util.Script;

public class AdminProductUpdateProcAction implements Action{
	
	 @Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 	int id = Integer.parseInt(request.getParameter("itemsId"));
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
			int result = itemsRepository.updateItem(item, id);
			
			if(result == 1) {
				Script.useScript("수정에 성공하였습니다.", "opener.location.reload(); window.close();", response);
			} else {
				Script.back("수정에 실패하였습니다.", response);
			}
	}
}
