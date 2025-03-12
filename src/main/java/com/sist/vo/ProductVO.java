package com.sist.vo;

import lombok.Data;

/*
PRODUCT_NO	NUMBER
NAME	VARCHAR2(1000 BYTE)
TYPE	VARCHAR2(50 BYTE)
PRICE	VARCHAR2(100 BYTE)
POSTER	VARCHAR2(200 BYTE)
DELIVER	VARCHAR2(200 BYTE)
ALC	VARCHAR2(100 BYTE)
VOLUMN	VARCHAR2(100 BYTE)
LOC	VARCHAR2(2000 BYTE)
CONTENT	CLOB
CNO	VARCHAR2(20 BYTE)
DELIVERY_FEE	VARCHAR2(100 BYTE)
HIT	NUMBER
 */
@Data
public class ProductVO {
	private String name,type,price,poster,deliver,alc,volumn,loc,content,cno,delivery_fee;
	private int product_no,hit;
}
