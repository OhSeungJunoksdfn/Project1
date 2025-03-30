package com.sist.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityCommentVO {
	int comment_no,post_no,group_id,is_reply;
	String id,content,post_type;
	Date regdate;
	
}
