package com.sist.vo;

import java.util.Date;

import lombok.Data;

/*
 * 
 * COMMENT_NO        NOT NULL NUMBER         
BOARD_NO          NOT NULL NUMBER         
ID                NOT NULL VARCHAR2(20)   
CONTENT           NOT NULL VARCHAR2(1000) 
REGDATE                    DATE           
PARENT_COMMENT_NO          NUMBER    
 */

@Data
public class CommunityCommentVO {
	int comment_no,board_no,parent_comment_no,is_reply;
	String id,content;
	Date regdate;
	
}
