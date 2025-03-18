package com.sist.vo;

import java.sql.Date;

import lombok.Data;

/*
 *  ID             NOT NULL VARCHAR2(20)  
	PWD            NOT NULL VARCHAR2(30)  
	NAME           NOT NULL VARCHAR2(51)  
	SEX            NOT NULL CHAR(6)       
	EMAIL                   VARCHAR2(100) 
	BIRTHDAY       NOT NULL VARCHAR2(10)  
	POST           NOT NULL VARCHAR2(10)  
	ADDRESS        NOT NULL VARCHAR2(100) 
	ADDRESS_DETAIL          VARCHAR2(100) 
	REGDATE                 DATE          
	COMENT                  CLOB          
	ADMIN                   VARCHAR2(1)   
	LOGIN                   VARCHAR2(1)   
	PHONE                   VARCHAR2(13)  
	AVATAR                  VARCHAR2(100) 
 */

@Data
public class CocktailMemberVO {
	private String id,pwd,name,sex,email,birthday,post,address,address_detail,coment,admin,login,phone,avatar,msg;
	private Date regdate;
	
}