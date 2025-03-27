package com.sist.model;
//////////
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONObject;

import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.dao.*;
@Controller
public class Cart2Model {
  @RequestMapping("cart2/cart_insert.do")
  public String cart_insert(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String pno=request.getParameter("pno");
	  String account=request.getParameter("account");
	  String cart_price=request.getParameter("cart_price");
	  
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  Cart2VO vo=new Cart2VO();
	  vo.setAccount(Integer.parseInt(account));
	  vo.setPno(Integer.parseInt(pno));
	  vo.setCart_price(Integer.parseInt(cart_price));
	  vo.setId(id);
	  
	  Cart2DAO.cartInsert(vo);
	  return "redirect:../mypage/mypage_cart_list.do";
  }
  @RequestMapping("cart2/cart_cancel.do")
  public String cart_cancle(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String cno=request.getParameter("cno");
	  System.out.println("cno="+cno);
	  Cart2DAO.cartCancel(Integer.parseInt(cno));
	  return "redirect:../mypage/mypage_cart_list.do";
  }
  @RequestMapping("cart2/buy_insert.do")
  public void buy_insert(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String pno=request.getParameter("pno");
	  String account=request.getParameter("account");
	  String cart_price=request.getParameter("cart_price");
	  System.out.println(pno);
	  System.out.println(account);
	  System.out.println(cart_price);
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  cart_price=cart_price.replace(",", "");
	  cart_price=cart_price.replace("원", "");
	  Cart2VO vo=new Cart2VO();
	  vo.setAccount(Integer.parseInt(account));
	  vo.setPno(Integer.parseInt(pno));
	  vo.setCart_price(Integer.parseInt(cart_price));
	  //replace => 
	  
	  vo.setId(id);
	  
	  Cart2DAO.cartInsert(vo);
	 
	  CocktailMemberVO mvo=CocktailMemberDAO.memberUpdateData(id);
	  System.out.println("id:"+id+",name="+mvo.getName());
	  JSONObject obj=new JSONObject();
	  obj.put("name", mvo.getName());
	  obj.put("email", mvo.getEmail());
	  obj.put("phone", mvo.getPhone());
	  obj.put("address", mvo.getAddress()+" "+mvo.getAddress_detail());
	  obj.put("post", mvo.getPost());
	  
	  try
	  {
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(obj.toJSONString());
	  }catch(Exception ex) {
		  ex.printStackTrace();
	  }
  }
}