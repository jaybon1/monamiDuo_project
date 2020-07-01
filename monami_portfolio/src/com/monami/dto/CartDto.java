package com.monami.dto;

import com.monami.model.Cart;
import com.monami.model.Items;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartDto {
	Cart cart;
	Items item;
}
