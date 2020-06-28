package com.monami.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NaverProfile {

	public String resultcode;
	public String message;
	public Response response;

	@Data
	public class Response {

		public String id;
//		public String name;
		public String email;

	}
}