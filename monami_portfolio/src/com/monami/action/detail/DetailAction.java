package com.monami.action.detail;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.monami.action.Action;
import com.monami.dto.BodyColor;
import com.monami.dto.InkColor;
import com.monami.dto.ItemDetailDto;
import com.monami.dto.ProductSpec;
import com.monami.model.Items;
import com.monami.repository.ItemsRepository;

public class DetailAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		ItemsRepository itemsRepository = ItemsRepository.getInstance();
		Items item = itemsRepository.findById(id);
		
		ItemDetailDto idd = null;
		
		
		List<String> mainCharacList = new ArrayList<>();
		if(item.getMainCharac() != null) {
			String[] mainCharacs = item.getMainCharac().split(",,");
			for (int i = 0; i < mainCharacs.length; i++) {
				mainCharacList.add(mainCharacs[i]);
			}
			
		}
		
		List<BodyColor> bodyColorList = new ArrayList<>();
		if(item.getBodyColor() != null) {
			String[] bodyColors = item.getBodyColor().split(",,");
			for (int i = 0; i < bodyColors.length; i++) {
				BodyColor bodyColor = BodyColor.builder()
						.url(bodyColors[i].split("!!")[0])
						.name(bodyColors[i].split("!!")[1])
						.build();
				bodyColorList.add(bodyColor);
			}			
		}
		
		List<InkColor> inkColorList = new ArrayList<>();
		if(item.getInkColor() != null) {
			String[] inkColors = item.getInkColor().split(",,");
			for (int i = 0; i < inkColors.length; i++) {
				InkColor inkColor = InkColor.builder()
						.url(inkColors[i].split("!!")[0])
						.name(inkColors[i].split("!!")[1])
						.build();
				inkColorList.add(inkColor);
			}
		}
		
		
		List<ProductSpec> productSpecList = new ArrayList<>();
		if(item.getProductSpec() != null) {
			String[] productSepcs = item.getProductSpec().split(",,");
			for (int i = 0; i < productSepcs.length; i++) {
				ProductSpec productSpec = ProductSpec.builder()
						.url(productSepcs[i].split("!!")[0])
						.name(productSepcs[i].split("!!")[1])
						.build();
				productSpecList.add(productSpec);
			}
		}
		
		
		
	
		idd = ItemDetailDto.builder()
				.id(item.getId())
				.name(item.getName())
				.imgUrl(item.getImgUrl())
				.price(item.getPrice().replace(",", ""))
				.value(item.getValue())
				.charac(item.getCharac())
				.detailImgUrl(item.getDetailImgUrl())
				.bodyColorList(bodyColorList)
				.inkColorList(inkColorList)
				.productSpecList(productSpecList)
				.mainCharacList(mainCharacList)
				.build();
		
		
		request.setAttribute("idd",idd);
		
		RequestDispatcher dis = request.getRequestDispatcher("detail.jsp");
		dis.forward(request, response);
	}
}
