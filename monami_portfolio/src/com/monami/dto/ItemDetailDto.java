package com.monami.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Builder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemDetailDto {
	private int id;
	private String imgUrl;
	private String name;
	private String price;
	private String tag;
	private String value;
	private List<BodyColor> bodyColorList;
	private List<InkColor> inkColorList;
	private String productSpec;
	private String charac;
	private List<String> mainCharacList;
	private String detailImgUrl;
	
	public class BodyColor{
		String url;
		String name;
	}
	
	public class InkColor{
		String url;
		String name;
	}
}






