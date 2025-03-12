package com.sist.model;

import com.sist.controller.Controller; 
import com.sist.controller.RequestMapping;
import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;







@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response)
	{
		CocktailbarVO cbvo = CocktailbarDAO.cocktailbarHouseData();
		List<CocktailbarVO> chlist = CocktailbarDAO.cocktailbarHouseData12();
		List<CocktailVO> list = CocktailDAO.cocktailData12();
		List<ProductVO> plist = ProductDAO.productHouseData12();
		List<CocktailVO> clist= CocktailDAO.cocktailHouseData12();
		List<CocktailVO> inglist= CocktailDAO.ingredientsHouseData12();
		List<NewsVO> newslist = NewsDAO.newsHouseData3();
		
		request.setAttribute("chlist", chlist);
		request.setAttribute("plist", plist);
		request.setAttribute("cbvo", cbvo);
		request.setAttribute("list", list);
		request.setAttribute("clist", clist);
		request.setAttribute("inglist", inglist);
		request.setAttribute("newslist", newslist);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
