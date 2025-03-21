package com.sist.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.Cocktail_ProductDAO;
import com.sist.vo.Cocktail_ProductVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import oracle.net.ns.SessionAtts;

@Controller
public class Cocktail_ProductModel {
	 @RequestMapping("cocktail_product/cocktail_product_list.do")
	 public String cocktail_product_list(HttpServletRequest request, HttpServletResponse response)
	 {
		String page=request.getParameter("page");
		if(page==null)
			  page="1";
		String cno=request.getParameter("cno");
		if(cno==null)
			cno="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end",curpage*12);
		map.put("cno", cno);
		List<Cocktail_ProductVO> list=Cocktail_ProductDAO.cocktail_productListData(map);
		int totalpage=Cocktail_ProductDAO.cocktail_productTotalPage(map);
		int totalcount=Cocktail_ProductDAO.cocktail_productTotalCount(map);
		
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=startPage+BLOCK-1;
		  
		if(endPage>totalpage)
			endPage=totalpage;
		
		Cocktail_ProductVO vo=Cocktail_ProductDAO.cocktail_productCnoRandomData(map);
		List<Cocktail_ProductVO> rList=Cocktail_ProductDAO.cocktail_productCnoRandomData12(map);
		
		request.setAttribute("vo", vo);
		request.setAttribute("rList", rList);
		request.setAttribute("cno", cno);
		
		List<Cocktail_ProductVO> cList=new ArrayList<Cocktail_ProductVO>();
		Cookie[] cookies=request.getCookies();
		if(cookies!=null)
		  {
			  // Cookie cookie=new Cookie("food_"+fno, fno);
			  for(int i=cookies.length-1;i>=0;i--)
			  {
				  if(cookies[i].getName().startsWith("product_no_"))
				  {
					  String product_no=cookies[i].getValue();
					  Cocktail_ProductVO cvo=Cocktail_ProductDAO.cocktail_productCookieData(Integer.parseInt(product_no));
					  cList.add(cvo);
				  }
			  }
		  }
		List<List<Cocktail_ProductVO>>cList4=new ArrayList<>();
		int pageSize=4;
		for(int i=0;i<cList.size();i+=pageSize)
		{
			int end=Math.min(i+pageSize, cList.size());
			cList4.add(cList.subList(i, end));
		}
		
		
		request.setAttribute("cList", cList);
		request.setAttribute("cList4", cList4);
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalcount", totalcount);
		request.setAttribute("main_jsp", "../cocktail_product/cocktail_product_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktail_product/cocktail_product_detail_before.do")
	public String cocktail_product_detail_before(HttpServletRequest request, HttpServletResponse response)
	{
		String product_no=request.getParameter("product_no");
		String cno=request.getParameter("cno");
		Cookie cookie=new Cookie("product_no_"+product_no, product_no);
		cookie.setPath("/");
		cookie.setMaxAge(60^60*24);
		// 전송
		response.addCookie(cookie);
		// 화면 이동
		return "redirect:cocktail_product_detail.do?product_no="+product_no+"&cno="+cno;
	}
	@RequestMapping("cocktail_product/cocktail_product_detail.do")
	public String cocktail_product_detail(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
		String product_no=request.getParameter("product_no");
		String cno=request.getParameter("cno");
		
		Cocktail_ProductVO vo=Cocktail_ProductDAO.cocktail_productDetailData(Integer.parseInt(product_no));
		
		int rcno=Integer.parseInt(cno);
		List<Cocktail_ProductVO> rList4=Cocktail_ProductDAO.cocktail_productCnoRandomData4(rcno);
		
		request.setAttribute("cno", cno);
		request.setAttribute("vo", vo);
		request.setAttribute("rList4", rList4);
		request.setAttribute("main_jsp", "../cocktail_product/cocktail_product_detail.jsp");
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return "../main/main.jsp";
	}
	@RequestMapping("cocktail_product/cocktail_product_find.do")
	public String cocktail_product_find(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../cocktail_product/cocktail_product_find.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktail_product/cocktail_product_find_ajax.do")
	public void cocktail_product_find_ajax(HttpServletRequest request, HttpServletResponse response)
	{
		// data:{"fd":fd,"ss":ss,"page":1}
		String page=request.getParameter("page");
		String fd=request.getParameter("fd");
		String ss=request.getParameter("ss");
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (20*curpage)-19);
		map.put("end", 20*curpage);
		map.put("ss", ss);
		map.put("fd",fd);
		List<Cocktail_ProductVO> list=Cocktail_ProductDAO.cocktail_productFindData(map);
		int totalpage=Cocktail_ProductDAO.cocktail_productFindTotalPage(map);
		  
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  
		if(endPage>totalpage)
			 endPage=totalpage;
		  
		// JSON변경 
		JSONArray arr=new JSONArray();
		int i=0;
		// product_no, name, type, price, poster, deliver, alc, volumn, loc, content, cno, hit
		for(Cocktail_ProductVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("product_no", vo.getProduct_no());
			obj.put("name", vo.getName());
			obj.put("type", vo.getType());
			obj.put("price", vo.getPrice());
			obj.put("poster", vo.getPoster());
			obj.put("delever", vo.getDeliver());
			obj.put("alc", vo.getAlc());
			obj.put("volumn", vo.getVolumn());
			obj.put("loc", vo.getLoc());
			obj.put("content", vo.getContent());
			obj.put("cno", vo.getCno());
			obj.put("hit", vo.getHit());
			if(i==0)
			{
				obj.put("curpage", curpage);
				obj.put("totalpage", totalpage);
				obj.put("startPage", startPage);
				obj.put("endPage",endPage);
			}
			  
			arr.add(obj);
			i++;
		  }
		  
		  // 전송
		  try
		  {
			  response.setContentType("text/plain;charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(arr.toJSONString());
		  }catch(Exception ex) {}
	  }
}
