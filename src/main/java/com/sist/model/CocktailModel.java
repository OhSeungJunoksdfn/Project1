package com.sist.model;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CocktailModel {
	@RequestMapping("cocktail/cocktail_list.do")
	public String cocktail_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage= Integer.parseInt(page);
		Map map = new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", (curpage*12));

	  List<CocktailVO> list = CocktailDAO.cocktailListData(map);
	  int totalpage = CocktailDAO.cocktailTotalPage();
	  
	  List<CocktailVO> clist = new ArrayList<CocktailVO>();
	  Cookie[] cookies= request.getCookies();
		if(cookies!=null)
		{
			for(int i=cookies.length-1; i>=0;i--)
			{
				if(cookies[i].getName().startsWith("cocktail_"))
				{
					String cno=cookies[i].getValue();
					CocktailVO vo = CocktailDAO.cocktailDetailData(Integer.parseInt(cno));
					clist.add(vo);
				}
			}
		}
	  
	  
	  request.setAttribute("list", list);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("curpage", curpage);
	  
	  request.setAttribute("cocktail_jsp", "../cocktail/cocktail_list.jsp");
		request.setAttribute("main_jsp","../cocktail/cocktail_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktail/cocktail_detail_before.do")
  public String food_detail_before(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  String cno=request.getParameter("cno");
	  Cookie cookie=new Cookie("cocktail_"+cno, cno);
	  cookie.setPath("/");
	  cookie.setMaxAge(60*60*24);
	  // 전송 
	  response.addCookie(cookie);
	  
	  // 화면 이동 
	  return "redirect:cocktail_detail.do?cno="+cno;
  }
	@RequestMapping("cocktail/cocktail_detail.do")
	public String cocktail_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String cno = request.getParameter("cno");
		CocktailVO vo = CocktailDAO.cocktailDetailData(Integer.parseInt(cno));
		List<CocktailVO> list = CocktailDAO.cocktailRecipeData(Integer.parseInt(cno));
		List<CocktailVO> tags = CocktailDAO.cocktailTagData(Integer.parseInt(cno));
		
		request.setAttribute("tags", tags);
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../cocktail/cocktail_detail.jsp");
		return "../main/main.jsp";
	}
}
