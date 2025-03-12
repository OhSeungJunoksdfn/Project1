package com.sist.vo;

import lombok.Data;

/*
ING_NO	NUMBER
INGNAME	VARCHAR2(100 BYTE)
COMMENTS	VARCHAR2(600 BYTE)
ALC	VARCHAR2(100 BYTE)
INGTAG	VARCHAR2(30 BYTE)
IMAGE	VARCHAR2(260 BYTE)
ENAME	VARCHAR2(100 BYTE)
 */
@Data
public class CocktailIngredientsVO {
	private int ing_no;
	private String ingname,comments, alc,ingtag,ciimage,ename;
}
