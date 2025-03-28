package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONObject;

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
		String price=request.getParameter("price");
		String priceInt=request.getParameter("price");
		String product_no=request.getParameter("pno");
		String cno=request.getParameter("cno");
		
		System.out.println("필수 파라미터 : pno=" + pno + ", account=" + account + ", priceInt=" + priceInt);
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
		vo.setCno(Integer.parseInt(cno));
		vo.setPriceInt(Integer.parseInt(price));
		vo.setId(id);
		
		if (id == null || id.trim().isEmpty()) {
	        return "../member/login.jsp";
	    }
		
		CartDAO.cartInsert(vo);

		return "redirect:../cocktail_product/cocktail_product_detail.do?product_no="+product_no+"&cno="+cno;
	}
	
	@RequestMapping("cart/cart_delete.do")
	public String cart_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		if(cno!=null && !cno.trim().isEmpty())
		{
	        CartDAO.cartDelete(Integer.parseInt(cno));
	        System.out.println("cno의 값 : "+cno);
	    }
		System.out.println("cno의 값 : "+cno);
		return "redirect:../cart/cart_list.do";
	}
	
	@RequestMapping("cart/buy_insert.do")
	public void buy_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String cno=request.getParameter("cno");
		String account=request.getParameter("account");
		String price=request.getParameter("price");
		  
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		  
		CartVO vo=new CartVO();
		vo.setAccount(Integer.parseInt(account));
		vo.setCno(Integer.parseInt(cno));
		vo.setPriceInt(Integer.parseInt(price));
		vo.setId(id);
		  
		CartDAO.buyInsert(vo);
		
//		CocktailMemberVO cmvo=CocktailMemberDAO.memberInfoData(id);
//		System.out.println("id:"+id+",name="+cmvo.getName());
//		JSONObject obj=new JSONObject();
//		obj.put("name", cmvo.getName());
//		obj.put("email", cmvo.getEmail());
//		obj.put("phone", cmvo.getPhone());
//		obj.put("address", cmvo.getAddress()+" "+cmvo.getAddress_detail());
//		obj.put("post", cmvo.getPost());
//		  
//		try
//		{
//			response.setContentType("text/plain;charset=UTF-8");
//			PrintWriter out=response.getWriter();
//			out.write(obj.toJSONString());
//		}catch(Exception e)
//		{
//			e.printStackTrace();
//		}
		  
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