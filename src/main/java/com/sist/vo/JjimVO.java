package com.sist.vo;

import java.util.*;

import lombok.Data;

@Data
public class JjimVO {
	private int jno, rno, type;
	private String id;
	private Date regdate;
	private Cocktail_ProductVO cpvo=new Cocktail_ProductVO();
}
