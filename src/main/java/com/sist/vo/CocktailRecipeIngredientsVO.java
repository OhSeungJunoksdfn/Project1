package com.sist.vo;

import lombok.Data;

/*
RECIPE_NO	NUMBER
COCKTAIL_NO	NUMBER
ING_NO	NUMBER
VOLUME	NUMBER
UNIT	CHAR(8 BYTE)
 */
@Data
public class CocktailRecipeIngredientsVO {
	private int recipe_no,cocktail_no,ing_no,volume;
	private String unit;
}
