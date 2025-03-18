package com.sist.vo;

import lombok.Data;

/*
	PRODUCT_NO   NOT NULL 	NUMBER         
	NAME         NOT NULL 	VARCHAR2(1000) 
	TYPE         NOT NULL 	VARCHAR2(50)   
	PRICE        NOT NULL 	VARCHAR2(100)  
	POSTER       NOT NULL 	VARCHAR2(200)  
	DELIVER      NOT NULL 	VARCHAR2(200)  
	ALC                  	VARCHAR2(100)  
	VOLUMN                	VARCHAR2(100)  
	LOC                   	VARCHAR2(2000) 
	CONTENT               	CLOB           
	CNO          NOT NULL 	NUMBER         
	HIT                   	NUMBER         
	DELIVERY_FEE          	VARCHAR2(100) 
 */
@Data
public class Cocktail_ProductVO {
	private int product_no, cno, hit;
	private String name, type, price, poster, deliver, alc, volumn, loc, content, delevery_fee;
}
