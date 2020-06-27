package com.monami.test;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class JsoupDto {
	private int id;
	private String imgUrl;
	private String name;
	private String price;
	private String tag;
}
