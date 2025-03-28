package com.sist.model;
import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		int totalcount=Product2DAO.productTotalCount(map);
		List<Product2VO> plist=Product2DAO.RecommendData6();
		request.setAttribute("plist", plist);
		 
		// 쿠키
		List<Product2VO> clist=new ArrayList<Product2VO>();
		Cookie[] cookies=request.getCookies();
		if(cookies!=null)
		{
			// Cookie cookie=new Cookie(product2_"+product_no,product_no);
			for(int i=cookies.length-1;i>=0;i--)
			{
				if(cookies[i].getName().startsWith("product2_"))
				{
					String product_no=cookies[i].getValue();
					Product2VO vo=Product2DAO.productCookieData(Integer.parseInt(product_no));
					
					clist.add(vo);
					
				}
			}
		}
		
		request.setAttribute("clist", clist);
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
		request.setAttribute("totalcount", totalcount);
		
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
		String price2=vo.getPrice();
		price2=price2.replaceAll("[^0-9]", "");
		vo.setPrice2(Integer.parseInt(price2));
		List<CocktailVO> elist=Product2DAO.RelatedData4();
//		for(CocktailVO evo:elist)
//		{
//			System.out.println(evo.getImage());
//		}
		request.setAttribute("elist", elist);
		
		/*
		 JjimVO jvo=new JjimVO();
		  jvo.setRno(Integer.parseInt(product_no));
		  jvo.setType(2);
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  jvo.setId(id);
		  
		  if(id!=null)
		  {
			  int jCount=JjimDAO.jjimCheckCount(jvo);
			  request.setAttribute("jCount", jCount);
		  }
		  */
		
		
		/// 댓글
		ReplyVO rvo=new ReplyVO();
		rvo.setRno(Integer.parseInt(product_no));
		rvo.setType(1);
		List<ReplyVO> clist=ReplyDAO.replyListData(rvo);
		int count=ReplyDAO.replyCount(rvo);
		request.setAttribute("clist", clist);
		request.setAttribute("count", count);
		//request.setAttribute("rList", list);

		
		request.setAttribute("main_jsp", "../product2/product_detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("product2/product_find.do")
	public String product_find(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../product2/product_find.jsp");
		return "../main/main.jsp";
	}
	//../product2/product_find_ajax.do
	@RequestMapping("product2/product_find_ajax.do")
	public void product_find_ajax(HttpServletRequest request,HttpServletResponse response)
	{
		  String page=request.getParameter("page");
		  
		  String fd=request.getParameter("fd");
		  String ss=request.getParameter("ss");
		  int curpage=Integer.parseInt(page);
		  Map map=new HashMap();
		  map.put("start",(12*curpage)-11);
		  map.put("end",12*curpage);
		 
		  map.put("ss",ss);
		  map.put("fd",fd);
		  List<Product2VO> list=Product2DAO.productFindData(map);
		  int totalpage=Product2DAO.productFindTotalPage(map);
		  
		  final int BLOCK=5;
		  int startPage=((curpage-1)/BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  
		  if(endPage>totalpage)
			  endPage=totalpage;
		  
		  /*	private int product_no,hit,jjimcount,likecount,replycount;
	private String name,price,poster,cno,delivery_fee;
	*/
		  JSONArray arr=new JSONArray();
		  
		  int i=0;
		  for(Product2VO vo:list)
		  {
			  JSONObject obj=new JSONObject();
			  obj.put("product_no",vo.getProduct_no());
			  obj.put("name",vo.getName());
			  obj.put("poster",vo.getPoster());
			  obj.put("price",vo.getPrice());
			  obj.put("type", vo.getType());
		
			 // obj.put("likecount",vo.getLikecount() );
			 // obj.put("replycount",vo.getReplycount() );
			  if(i==0)
			  {
				  obj.put("curpage",curpage);
				  obj.put("totalpage",totalpage);
				  obj.put("startPage",startPage);
				  obj.put("endPage",endPage);
			  }
			  arr.add(obj);
			  i++;
		  }
		  try
		  {
			  response.setContentType("text/plain;charset=UTF-8");
			  PrintWriter out=response.getWriter();
			  out.write(arr.toJSONString());
		  }catch(Exception ex) {}
		  
	}
	
	

}
