package com.sist.vo;
import lombok.Data;

/*
BAR_NO	NUMBER
NAME	VARCHAR2(100 BYTE)
ADDRESS	VARCHAR2(100 BYTE)
PHONE	VARCHAR2(14 BYTE)
IMAGE	VARCHAR2(300 BYTE)
PROFILE	CLOB
HIT	NUMBER
TIME	VARCHAR2(500 BYTE)
LOC	VARCHAR2(10 BYTE)
SUBWAY	VARCHAR2(500 BYTE)
 */

@Data
public class CocktailbarVO {
	private int bar_no,hit;
	private String name,address,phone,image,profile,time,loc,subway;
}
