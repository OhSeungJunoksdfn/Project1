package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.vo.*;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
@Controller
public class CocktailbarModel {
	@RequestMapping("cocktailbar/cocktailbar_list.do")
	public String cocktailbar_list(HttpServletRequest request,
			   HttpServletResponse response)
	{
		  String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  Map map=new HashMap();
		  map.put("start", (curpage*12)-11);
		  map.put("end",curpage*12);
		  List<CocktailbarVO> list=CocktailbarDAO.cocktailbarListData(map);
		  int totalpage=CocktailbarDAO.cocktailbarTotalPage();
		  final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;		  
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  if(endPage>totalpage)
			  endPage=totalpage;
		  
		  List<CocktailbarVO> cList=new ArrayList<CocktailbarVO>();
		  Cookie[] cookies=request.getCookies();
		  if(cookies!=null)
		  {
			  for(int i=cookies.length-1;i>=0;i--)
			  {
				  if(cookies[i].getName().startsWith("cocktailbar_"))
				  {
					  String bar_no=cookies[i].getValue();
					  CocktailbarVO bvo=CocktailbarDAO.cocktailbarCookieData(Integer.parseInt(bar_no));
					  // where fno=1
					  cList.add(bvo);
				  }
			  }
		  }
		  request.setAttribute("cList", cList);
		  
		  request.setAttribute("list", list);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("startPage", startPage);
		  request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../cocktailbar/cocktailbar_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktailbar/cocktailbar_detail.do")
	public String cocktailbar_detail(HttpServletRequest request,
			   HttpServletResponse response)
	{
	  String bar_no=request.getParameter("bar_no");
	  CocktailbarVO vo=CocktailbarDAO.cocktailbarDetailData(Integer.parseInt(bar_no));
	  // 경기 포천시 내촌면 내리 267
	  String addr1=vo.getAddress();
//	  addr=addr.substring(addr.indexOf(" "));
	  // 포천시 내촌면 내리 267
//	  String addr1=addr.trim();
	  addr1=addr1.substring(addr1.trim().indexOf(" "));
	  // 내촌면 내리 267
	  String addr2=addr1.trim();
	  addr2=addr1.substring(0,addr2.indexOf(" ")+1);
	  String addr3=addr2.trim();
	  request.setAttribute("addr", addr3);
	  
	  
	  List<CocktailbarVO> cbList=CocktailbarDAO.cocktailbarHouseData12();
	  request.setAttribute("cbList", cbList);
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../cocktailbar/cocktailbar_detail.jsp");
	  return "../main/main.jsp";
	}
	@RequestMapping("cocktailbar/cocktailbar_detail_before.do")
	  public String cocktailbar_detail_before(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String bar_no=request.getParameter("bar_no");
		  Cookie cookie=new Cookie("cocktailbar_"+bar_no, bar_no);
		  cookie.setPath("/");
		  cookie.setMaxAge(60*60*24);
		  // 전송 
		  response.addCookie(cookie);
		  
		  // 화면 이동 
		  return "redirect:cocktailbar_detail.do?bar_no="+bar_no;
	  }
	
	
	  @RequestMapping("cocktailbar/cocktailbar_find.do")
	  public String recipe_find(HttpServletRequest request,
	  		HttpServletResponse response)
	  {
	  	request.setAttribute("main_jsp", "../cocktailbar/cocktailbar_find.jsp");
	  	return "../main/main.jsp";
	  }
	  @RequestMapping("cocktailbar/cocktailbar_find_ajax.do")
	  public void recipe_find_ajax(HttpServletRequest request,
	  		HttpServletResponse response)
	  {
		  // data:{"fd":fd,"ss":ss,"page":1}
		  String page=request.getParameter("page");
		  String fd=request.getParameter("fd");
		  String ss=request.getParameter("ss");
		  int curpage=Integer.parseInt(page);
		  Map map=new HashMap();
		  map.put("start", (12*curpage)-11);
		  map.put("end", 12*curpage);
		  map.put("ss", ss);
		  map.put("fd",fd);
		  List<CocktailbarVO> list=CocktailbarDAO.cocktailbarFindData(map);
		  int totalpage=CocktailbarDAO.cocktailbarFindTotalPage(map);
		  
		  final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  
		  if(endPage>totalpage)
			 endPage=totalpage;
		  
		  // JSON변경 
		  JSONArray arr=new JSONArray();
		  int i=0;
		  // bar_no,name,address,phone,image,profile,hit,time,loc,subway
		  for(CocktailbarVO vo:list)
		  {
			  JSONObject obj=new JSONObject();
			  obj.put("bar_no", vo.getBar_no());
			  obj.put("name", vo.getName());
			  obj.put("address", vo.getAddress());
			  obj.put("phone", vo.getPhone());
			  obj.put("image", vo.getImage());
			  obj.put("profile", vo.getProfile());
			  obj.put("hit", vo.getHit());
			  obj.put("time", vo.getTime());
			  obj.put("loc", vo.getLoc());
			  obj.put("subway", vo.getSubway());
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
	  @RequestMapping("cocktailbar/cocktailbarboard_insert.do")
	  public String cocktailbarboard_insert(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  request.setAttribute("main_jsp", "../cocktailbar/cocktailbarboard_insert.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("cocktailbar/cocktailbarboard_insert_ok.do")
	   public String board_insert_ok(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		  //#{bar_no},#{name},#{address},#{phone},#{image},#{profile},#{time},#{loc},#{subway}
		   String name=request.getParameter("name");
		   String address=request.getParameter("address");
		   String phone=request.getParameter("phone");
		   String image=request.getParameter("image");
		   String profile=request.getParameter("profile");
		   String time=request.getParameter("time");
		   String loc=request.getParameter("loc");
		   String subway=request.getParameter("subway");
		   
		   CocktailbarVO vo=new CocktailbarVO();
		   vo.setName(name);
		   vo.setAddress(address);
		   vo.setPhone(phone);
		   vo.setImage(image);
		   vo.setProfile(profile);
		   vo.setTime(time);
		   vo.setLoc(loc);
		   vo.setSubway(subway);
		   
		   CocktailbarDAO.cocktailbarInsert(vo);
		   return "redirect:../cocktailbar/cocktailbarlist.do";
	   }
}
