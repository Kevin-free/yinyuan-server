package com.kevin.test;

public class TestEquals {
	public static void main(String[] args) {
		String s1 = "aaa";
		System.out.println(s1 == "aaa");
		System.out.println("equal:"+ s1.equals("aaa"));
		System.out.println("!equal:"+ !s1.equals("aaa"));
	}
}
