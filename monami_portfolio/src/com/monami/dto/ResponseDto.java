package com.monami.dto;

public class ResponseDto<T> {
	int status; //200이면 성공
	T data;
}
