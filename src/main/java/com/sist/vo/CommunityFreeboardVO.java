package com.sist.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

/*
 * BOARD_NO      NOT NULL NUMBER        
ID                     VARCHAR2(20)  
SUBJECT       NOT NULL VARCHAR2(100) 
CONTENT       NOT NULL CLOB          
IMAGE         NOT NULL VARCHAR2(260) 
TAG           NOT NULL CHAR(9)       
HIT                    NUMBER        
HTMLFILE      NOT NULL VARCHAR2(260) 
HTMLFILE_SIZE          NUMBER  
 * 
 */
@Data
public class CommunityFreeboardVO {
	int board_no, hit;
	String id, subject, tag, htmlfile, postState;//postState CHECK IN ('SAVED','UNSAVED')
	Date regdate;
}
