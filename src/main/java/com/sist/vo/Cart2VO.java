package com.sist.vo;


import java.util.*;

import lombok.Data;
@Data
public class Cart2VO {
  private int cno,pno,account,cart_price;
  private String id;
  private Date regdate;
  private Product2VO pvo=new Product2VO();
  private CocktailMemberVO mvo=new CocktailMemberVO();
}
