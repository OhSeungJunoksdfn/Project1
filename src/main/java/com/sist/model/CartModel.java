package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import org.apache.taglibs.standard.tag.el.fmt.RequestEncodingTag;
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
		String cno=request.getParameter("cno");
		String product_no=request.getParameter("product_no");
		
		System.out.println("필수 파라미터 : cno=" + pno + ", account=" + account + ", price" + price);
		if (pno == null || account == null || price == null ||
				pno.trim().isEmpty() || account.trim().isEmpty() || price.trim().isEmpty()) {
		        System.out.println("필수 파라미터 누락: pno=" + cno + ", account=" + account + ", price" + price);
		        request.setAttribute("error", "필수 파라미터가 누락되었습니다.");
		    }
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		CartVO vo=new CartVO();
		vo.setAccount(Integer.parseInt(account));
		vo.setPno(Integer.parseInt(pno));
		vo.setCno(Integer.parseInt(cno));
		
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
	
	@RequestMapping("cart/buy.do")
	public String buy(HttpServletRequest request, HttpServletResponse response)
	{
	    try {
	        String pno=request.getParameter("pno");
	        String cno=request.getParameter("cno");
	        String account=request.getParameter("account");
	        String price=request.getParameter("price");
	        String poster=request.getParameter("poster");
	        String pname=request.getParameter("pname");
	        String product_no=request.getParameter("product_no");
	        String totalPrice=request.getParameter("total-price");

	        HttpSession session=request.getSession();
	        String id=(String)session.getAttribute("id");

	        if (id==null || id.trim().isEmpty())
	        {
	            return "../member/login.jsp";
	        }

	        // 상품 상세 데이터 조회
	        if (product_no!=null && !product_no.isEmpty()) {
	            Cocktail_ProductVO cpvo=Cocktail_ProductDAO.cocktail_productDetailData(Integer.parseInt(product_no));
	            request.setAttribute("cpvo", cpvo);
	        }

	        // 구매 처리
	        CartVO vo=new CartVO();
	        vo.setCno(Integer.parseInt(cno));
	        vo.setId(id);
	        vo.setAccount(Integer.parseInt(account));
	        vo.setPrice(price);
	        CartDAO.buy(vo);

	        // 회원 정보 조회
	        CocktailMemberVO cmvo=CocktailMemberDAO.memberUpdateData(id);
	        request.setAttribute("cmvo", cmvo);

	        // 요청값들 다시 JSP로 넘기기
	        request.setAttribute("pno", pno);
	        request.setAttribute("cno", cno);
	        request.setAttribute("account", account);
	        request.setAttribute("price", price);
	        request.setAttribute("poster", poster);
	        request.setAttribute("pname", pname);
	        request.setAttribute("product_no", product_no);
	        request.setAttribute("totalPrice", totalPrice);

	        response.setContentType("text/plain;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print("success");

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    request.setAttribute("main_jsp", "../cart/buy.jsp");
	    return "../main/main.jsp";
	}
//	@RequestMapping("cart/buy_ok.do")
//	public void buy_ok(HttpServletRequest request, HttpServletResponse response)
//	{
//		
//	}
}