package com.monami.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Items {
	private int id;
	private String imgUrl;
	private String name;
	private String price;
	private String tag;
	private String value;
	private String bodyColor;
	private String inkColor;
	private String productSpec;
	private String charac;
	private String mainCharac;
	private String detailImgUrl;
}
