package com.sist.model;
import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import java.util.*;
@Controller
public class Product2Model {
	@RequestMapping("product2/product_list.do")
	public String product_list(HttpServletRequest request,HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start",(curpage*12)-11);
		map.put("end", curpage*12);
		List<Product2VO> list=Product2DAO.productListData(map);
		int totalpage=Product2DAO.productTotalPage();
		
		List<Product2VO> plist=Product2DAO.RecommendData6();
		  request.setAttribute("plist", plist);
		
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp","../product2/product_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("product2/product_detail_before.do") //product_detail_before.do
	public String product_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String product_no=request.getParameter("product_no");
		Cookie cookie=new Cookie("product2_"+product_no,product_no);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "redirect:../product2/product_detail.do?product_no="+product_no;
	}
	
	@RequestMapping("product2/product_detail.do")
	public String product_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String product_no=request.getParameter("product_no");
		Product2VO vo=Product2DAO.productDetailData(Integer.parseInt(product_no));
		request.setAttribute("vo", vo);
		/// 댓글
		ReplyVO rvo=new ReplyVO();
		rvo.setRno(Integer.parseInt(product_no));
		rvo.setType(1);
		List<ReplyVO> list=ReplyDAO.replyListData(rvo);
		int count=ReplyDAO.replyCount(rvo);
		request.setAttribute("count", count);
		request.setAttribute("rList", list);

		
		request.setAttribute("main_jsp", "../product2/product_detail.jsp");
		return "../main/main.jsp";
	}
	

}
