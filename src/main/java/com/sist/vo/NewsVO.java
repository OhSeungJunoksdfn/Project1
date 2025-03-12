package com.sist.vo;
import java.util.*;

import lombok.Data;
/*
NO	NUMBER
TITLE	VARCHAR2(2000 BYTE)
NAME	VARCHAR2(52 BYTE)
CONTENT	CLOB
REGDATE	DATE
HIT	NUMBER
IMAGE	VARCHAR2(2000 BYTE)
 */
@Data
public class NewsVO {
	private int no,hit;
	private String title,name,content,dbday,image;
	private Date regdate;
}
