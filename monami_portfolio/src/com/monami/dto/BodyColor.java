package com.monami.dto;

import lombok.Builder;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BodyColor{
	String url;
	String name;
}