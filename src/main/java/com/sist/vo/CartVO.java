package com.sist.vo;

import java.util.*;

import lombok.Data;

@Data
public class CartVO {
	private int cno, pno, account;
	private String id;
	private Date regdate;
	private Cocktail_ProductVO cpvo=new Cocktail_ProductVO();
}
