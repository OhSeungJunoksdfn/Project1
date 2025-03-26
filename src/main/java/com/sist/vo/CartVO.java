package com.sist.vo;

import java.util.*;

import lombok.Data;

@Data
public class CartVO {
	private int cno, pno, account, priceInt;
	private String id, price;
	private Date regdate;
	private Cocktail_ProductVO cpvo=new Cocktail_ProductVO();
	private CocktailMemberVO cmvo=new CocktailMemberVO();
}