package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
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
}
