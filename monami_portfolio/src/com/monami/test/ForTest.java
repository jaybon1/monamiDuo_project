package com.monami.test;

public class ForTest {
	public static void main(String[] args) {
		int a =0;
		for (int i = 0; i < 7001; i=i+10) {
			for (int j = 1; j < 11; j++) {
				System.out.println(i+j);
				System.out.println(a++);
			}
		}
	}
}	
