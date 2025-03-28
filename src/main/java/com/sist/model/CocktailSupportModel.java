package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
@Controller
public class CocktailSupportModel {
	@RequestMapping("cocktailbar/cocktailbar_find.do")
	public String cocktail_find(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../cocktailbar/cocktailbar_find.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktailbar/cocktailbar_find_ajax.do")
	public void cocktailbar_find_ajax(HttpServletRequest request, HttpServletResponse response)
	{
		String ss = request.getParameter("ss");
		if(ss=="") ss="*";
		String fd = request.getParameter("fd");
		String page = request.getParameter("page");
		int curpage=Integer.parseInt(page);
		Map map = new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", curpage*12);
		map.put("ss", ss);
		map.put("fd", fd);
		List<CocktailbarVO> list = CocktailSupportDAO.cocktailbarFind(map);
		int totalpage=CocktailSupportDAO.cocktailbarFindTotal(map);
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+10;
		if(endPage>totalpage) endPage=totalpage;
		
		JSONArray arr = new JSONArray();
		int i = 0;
		for(CocktailbarVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("bar_no",vo.getBar_no());
			obj.put("name",vo.getName());
			obj.put("image",vo.getImage());
			obj.put("loc",vo.getLoc());
	
			
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
		try
		{
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(arr.toJSONString());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	@RequestMapping("reserve/cocktailbar_reserve_main.do")
	public String cocktailbar_reserve_main(HttpServletRequest request,HttpServletResponse response)
	{
		
		request.setAttribute("main_jsp", "../support/cocktailbar_reserve_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("reserve/reserve_cocktailbar_list.do")
	public String reserve_cocktailbar_list(HttpServletRequest request,HttpServletResponse response)
	{
		String loc = request.getParameter("loc");
		if(loc==null) loc="*"; 
		List<CocktailbarVO> list = CocktailSupportDAO.cocktailbarRserveList(loc);
		
		request.setAttribute("list", list);
		return "../support/cocktailbar_reserve_list.jsp";
	}
	
	 @RequestMapping("reserve/cocktailbar_reserve_day.do")
	  public String reserve_day(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String strYear=request.getParameter("year");
		  String strMonth=request.getParameter("month");
		  String strDay="";
		  String rdays=request.getParameter("rdays");
				  
				  
		  Date date=new Date();
		  SimpleDateFormat sdf=
				  new SimpleDateFormat("yyyy-M-d");//1..09 11
		  String today=sdf.format(date);
		  
		  StringTokenizer st=new StringTokenizer(today,"-");
		  
		  String sy=st.nextToken();
		  String sm=st.nextToken();
		  strDay=st.nextToken();
		  
		  String tday=strDay;
		  String tyear=sy;
		  String tmonth=sm;
		  
		  if(strYear==null)
			  strYear=sy;
		  if(strMonth==null)
			  strMonth=sm;
		  
		  
		  int year=Integer.parseInt(strYear);
		  int month=Integer.parseInt(strMonth);
		  int day=Integer.parseInt(strDay);
		  
		  
		  // 요일 / 마지막 날 구하기 
		  Calendar cal=Calendar.getInstance();
		  cal.set(Calendar.YEAR, year);
		  cal.set(Calendar.MONTH, month-1); // 0(1) 1(2)...
		  cal.set(Calendar.DATE, 1);
		  
		  int week=cal.get(Calendar.DAY_OF_WEEK);
		  week=week-1; // 1(일)...
		  
		  int lastday=cal.getActualMaximum(Calendar.DATE);
		  
		  request.setAttribute("year", year);
		  request.setAttribute("month", month);
		  
		  request.setAttribute("week", week);
		  request.setAttribute("lastday",lastday);
		  request.setAttribute("rdays", rdays);
		  int[] reserveDays=new int[32];
		  // rdays=1,2,3,6,10...
		  if(month==Integer.parseInt(tmonth) && year==Integer.parseInt(tyear))
		  {
			  st=new StringTokenizer(rdays,",");
			  while(st.hasMoreTokens())
			  {
				  int d=Integer.parseInt(st.nextToken());
				  if(d>=day)
				  {
					  reserveDays[d]=1;
				  }
			  }
			  request.setAttribute("day", day);
		  }
		  else
		  {
			  st=new StringTokenizer(rdays,",");
			  while(st.hasMoreTokens())
			  {
				  int d=Integer.parseInt(st.nextToken());
				  reserveDays[d]=1;
				  
			  }
		  }
		  request.setAttribute("rday", reserveDays);
		  String[] weeks={"일","월","화","수","목","금","토"};
		  
		  request.setAttribute("weeks", weeks);
		  
		  return "../support/cocktailbar_reserve_day.jsp";
	  }
	 @RequestMapping("reserve/cocktailbar_time_info.do")
	  public String reserve_time(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String day=request.getParameter("day");
		  String times=CocktailSupportDAO.reserveDayTimeInfoData(Integer.parseInt(day));
		  List<String> tList=new ArrayList<String>();
		  // 1(09:00),64,,...
		  StringTokenizer st=new StringTokenizer(times,",");
		  while(st.hasMoreTokens())
		  {
			  String strTime=CocktailSupportDAO.reserveGetTimeData(Integer.parseInt(st.nextToken()));
			  tList.add(strTime);
		  }
		  request.setAttribute("tList", tList);
		  return "../support/cocktailbar_reserve_time.jsp";
	  }
	  @RequestMapping("reserve/cocktailbar_inwon_info.do")
	  public String reserve_inwon(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  return "../support/cocktailbar_reserve_inwon.jsp";
	  }
	  @RequestMapping("reserve/cocktailbar_reserve_insert.do")
	  public String reserve_insert(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String bar_no=request.getParameter("bar_no");
		  String day=request.getParameter("day");
		  String time=request.getParameter("time");
		  String inwon=request.getParameter("inwon");
		  
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  
		  
		  ReserveVO vo=new ReserveVO();
		  vo.setId(id);
		  vo.setDay(day);
		  vo.setTime(time);
		  vo.setInwon(inwon);
		  vo.setBar_no(Integer.parseInt(bar_no));
		  
		  CocktailSupportDAO.reserveInsert(vo);
		  return "redirect:../cocktailbar/cocktailbar_detail.do?bar_no="+bar_no;
	  }
	  
	  @RequestMapping("reserve/cocktailbar_reserve_mypage.do")
	  public String cocktailbar_reserve_mypage(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  HttpSession session = request.getSession();
		  String id = (String)session.getAttribute("id");
		  
		  List<ReserveVO> list = CocktailSupportDAO.reserveMypageList(id);
		  request.setAttribute("list", list);
		  request.setAttribute("main_jsp", "../support/cocktailbar_reserve_mypage.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("reserve/cocktailbar_reserve_daminpage.do")
	  public String cocktailbar_reserve_daminpage(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  HttpSession session = request.getSession();
		  String id = (String)session.getAttribute("id");
		  
		  List<ReserveVO> list = CocktailSupportDAO.reserveadminpageList(id);
		  request.setAttribute("list", list);
		  request.setAttribute("main_jsp", "../support/cocktailbar_reserve_adminpage.jsp");
		  return "../main/main.jsp";
	  }
	  
	  @RequestMapping("reserve/reserveisok_ok.do")
	  public String reserveisok_ok(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String rno = request.getParameter("rno");
		  
		  CocktailSupportDAO.isokUpdate(rno);
		  
		  return "../reserve/cocktailbar_reserve_daminpage.do";
	  }
	  @RequestMapping("reserve/reserveDelete.do")
	  public String reserveDelete(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  String rno = request.getParameter("rno");
		  
		  CocktailSupportDAO.reserveDelete(rno);
		  
		  return "redirect:../reserve/cocktailbar_reserve_mypage.do";
	  }

}
