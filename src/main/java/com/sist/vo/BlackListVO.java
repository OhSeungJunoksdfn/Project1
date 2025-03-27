package com.sist.vo;

import lombok.Data;

/*
 * BLACK_LIST_NO NOT NULL NUMBER        
	ID                     VARCHAR2(20)  
	NAME          NOT NULL VARCHAR2(51)  
	EMAIL         NOT NULL VARCHAR2(100) 
	REGDATE                DATE          
	REASON        NOT NULL VARCHAR2(260)  
 */
@Data
public class BlackListVO {
	private int black_list_no;
	private String id,name,email,regdate,reason;
}
