package com.sist.model;

import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

@Controller
public class CartModel {
	@RequestMapping("cart/cart_insert.do")
	public String cart_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String pno=request.getParameter("pno");
		String account=request.getParameter("account");
		String priceInt=request.getParameter("priceInt");
		String price=request.getParameter("price");
		String product_no=request.getParameter("pno");
		String cno=request.getParameter("cno");
		
		if (pno == null || account == null || priceInt == null ||
				pno.trim().isEmpty() || account.trim().isEmpty() || priceInt.trim().isEmpty()) {
		        System.out.println("필수 파라미터 누락: pno=" + pno + ", account=" + account + ", priceInt=" + priceInt);
		        request.setAttribute("error", "필수 파라미터가 누락되었습니다.");
		    }
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		CartVO vo=new CartVO();
		vo.setAccount(Integer.parseInt(account));
		vo.setPno(Integer.parseInt(pno));
		vo.setPriceInt(Integer.parseInt(price));
		vo.setId(id);
		
		if (id == null || id.trim().isEmpty()) {
	        request.setAttribute("error", "로그인이 필요합니다.");
	        return "../member/login.jsp";
	    }
		
		CartDAO.cartInsert(vo);
		

		return "redirect:../cocktail_product/cocktail_product_detail.do?product_no=" + product_no + "&cno=" + request.getParameter("cno");
	}
	
	@RequestMapping("cart/cart_delete.do")
	public String cart_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		CartDAO.cartDelete(Integer.parseInt(cno));
		
		System.out.println("cno 값 ="+cno);
		request.setAttribute("cno", cno);
		return "redirect:../cart/cart_list.do"+cno;
	}
	
	@RequestMapping("cart/buy_insert.do")
	public String buy_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String pno=request.getParameter("pno");
		String account=request.getParameter("account");
		String price=request.getParameter("price");
		
		
		 
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		
//		CartVO vo=new CartVO();
//		vo.setAccount(Integer.parseInt(account));
//		vo.setPno(Integer.parseInt(pno));
//		vo.setPrice(Integer.parseInt(price));
//		vo.setId(id);
//		
//		CartDAO.buyInsert(vo);
		
		return "redirect: ../cart/buy.jsp";
	}
	
	@RequestMapping("cart/cart_list.do")
	public String cart_list(HttpServletRequest request, HttpServletResponse response) 
	{
	    HttpSession session=request.getSession();
	    String id=(String)session.getAttribute("id");
	    String cno=request.getParameter("cno");
	    
	    if(id == null || id.trim().isEmpty()){
	        request.setAttribute("error", "로그인이 필요합니다.");
	        return "../member/login.jsp";
	    }
	    
	    
	    // DAO를 통해 해당 사용자의 장바구니 목록을 가져옴
	    List<CartVO> cartList=CartDAO.cartListData(id);
	    request.setAttribute("cno", cno);
	    request.setAttribute("cartList", cartList);
	    
	    request.setAttribute("main_jsp", "../cart/cart_list.jsp");
		return "../main/main.jsp";
	}
}