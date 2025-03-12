package com.sist.vo;

import lombok.Data;

/*
COCKTAIL_TAG_NO	NUMBER
COCKTAIL_NO	NUMBER
VALUE	VARCHAR2(30 BYTE)
 */
@Data
public class CocktailTagVO {
	private int cocktail_tag_no,cocktail_no;
	private String value;
}
