package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CocktailModel {
	String[] sorts = {"","ORDER BY COCKTAIL_NO DESC","ORDER BY HIT DESC","ORDER BY HIT ASC","ORDER BY TO_NUMBER(ALC) DESC","ORDER BY TO_NUMBER(ALC) ASC"};
	@RequestMapping("cocktail/cocktail_list.do")
	public String cocktail_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page = request.getParameter("page");
		if(page==null) page="1";
		String sort= request.getParameter("sort");
		if(sort==null) sort="1";
		int curpage= Integer.parseInt(page);
		Map map = new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", (curpage*12));
		map.put("detail","y");
		map.put("sort", sorts[Integer.parseInt(sort)]);

	  List<CocktailVO> list = CocktailDAO.cocktailListData(map);
	  int count = CocktailDAO.cocktailTotalPage("y");
	  int totalpage = (int) Math.ceil(count/12.0);
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
	  request.setAttribute("clist", clist);
	  request.setAttribute("count", count);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("sort", sort);
	  
	  request.setAttribute("cocktail_jsp", "../cocktail/cocktail_list.jsp");
		request.setAttribute("main_jsp","../cocktail/cocktail_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktail/cocktail_my.do")
	public String cocktail_my(HttpServletRequest request, HttpServletResponse response)
	{
		String page = request.getParameter("page");
		if(page==null) page="1";
		String sort= request.getParameter("sort");
		if(sort==null) sort="1";
		int curpage= Integer.parseInt(page);
		Map map = new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", (curpage*12));
		map.put("detail","n");
		map.put("sort", sorts[Integer.parseInt(sort)]);
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		

	  List<CocktailVO> list = CocktailDAO.cocktailListData(map);
	  int count = CocktailDAO.cocktailTotalPage("n");
	  int totalpage = (int) Math.ceil(count/12.0);
	  if(endPage>totalpage) endPage=totalpage;
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
	  request.setAttribute("count", count);
	  request.setAttribute("clist", clist);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("sort", sort);
	  
	  request.setAttribute("cocktail_jsp", "../cocktail/cocktail_my.jsp");
		request.setAttribute("main_jsp","../cocktail/cocktail_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("cocktail/cocktail_detail_before.do")
  public String cocktail_detail_before(HttpServletRequest request,
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
		String[] contents = vo.getContent().split("\\d+\\.\\s*");
		List<CocktailVO> tags = CocktailDAO.cocktailTagData(Integer.parseInt(cno));
		List<CocktailVO> clist = CocktailDAO.cocktailData4();
		
		//댓글 기능
		String posType = "cocktail";//게시물 종류
		Map map=new HashMap();
		map.put("post_type", posType);
		map.put("post_no", Integer.parseInt(cno));//게시물번호
		List<CommunityCommentVO> ilist = CommunityCommentDAO.getCommentData(map);
		int numberOfComment = CommunityCommentDAO.getNumberOfComment(map);
		request.setAttribute("comment_list", ilist);
		request.setAttribute("number_of_comment", numberOfComment);
		//
		
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		request.setAttribute("contents", contents);
		request.setAttribute("tags", tags);
		request.setAttribute("clist", clist);
		
		request.setAttribute("main_jsp", "../cocktail/cocktail_detail.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("cocktail/cocktail_ingredients.do")
	public String cocktail_ingredients(HttpServletRequest request, HttpServletResponse response)
	{
		String page = request.getParameter("page");
		if(page==null) page="1";
		int curpage= Integer.parseInt(page);
		Map map = new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", (curpage*12));
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;

	  List<CocktailVO> list = CocktailDAO.ingredientsListData(map);
	  int count = CocktailDAO.ingredientsTotalPage();
	  int totalpage = (int) Math.ceil(count/12.0);
	  if(endPage>totalpage) endPage=totalpage;
	  
	  
	  request.setAttribute("list", list);
	  request.setAttribute("count", count);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  request.setAttribute("cocktail_jsp", "../cocktail/cocktail_ingredients.jsp");
		request.setAttribute("main_jsp","../cocktail/cocktail_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("cocktail/cocktail_ingredient_detail.do")
	public String cocktail_ingredient_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String no = request.getParameter("no");
		CocktailVO vo = CocktailDAO.ingredientsDetailData(Integer.parseInt(no));
		List<CocktailVO> list = CocktailDAO.ingredientsMakeList(Integer.parseInt(no));
		List<CocktailVO> clist = CocktailDAO.cocktailData4();
		request.setAttribute("clist", clist);
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../cocktail/cocktail_ingredient_detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktail/cocktail_find.do")
	public String cocktail_find(HttpServletRequest request, HttpServletResponse response)
	{
		
		request.setAttribute("cocktail_jsp", "../cocktail/cocktail_find.jsp");
		request.setAttribute("main_jsp", "../cocktail/cocktail_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("cocktail/cocktail_find_ajax.do")
	public void cocktail_find_ajax(HttpServletRequest request, HttpServletResponse response)
	{
		String ss = request.getParameter("ss");
		if(ss=="") ss="*";
		String page = request.getParameter("page");
		int curpage=Integer.parseInt(page);
		Map map = new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end", curpage*12);
		map.put("ss", ss);
		List<CocktailVO> list = CocktailDAO.cocktailFindData(map);
		int count=CocktailDAO.cocktailFindCount(ss);
		int totalpage = (int) (Math.ceil(count/12.0));
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+10;
		if(endPage>totalpage) endPage=totalpage;
		
		JSONArray arr = new JSONArray();
		int i = 0;
		for(CocktailVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("cocktail_no",vo.getCocktail_no());
			obj.put("id",vo.getId());
			obj.put("name",vo.getName());
			obj.put("ename",vo.getEname());
			obj.put("comments",vo.getComments());
			obj.put("alc",vo.getAlc());
			obj.put("image",vo.getImage());
			obj.put("content",vo.getContent());
			obj.put("detail",vo.getDetail());
			obj.put("hit",vo.getHit());
			obj.put("likes",vo.getLikes());
			
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
	@RequestMapping("cocktail/cocktail_insert.do")
	public String cocktail_insert(HttpServletRequest request, HttpServletResponse response)
	{
		
		
		request.setAttribute("main_jsp", "../cocktail/cocktail_insert.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("cocktail/cocktail_insert_ok.do")
	public String cocktail_insert_ok(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		String name= request.getParameter("name");
		String ename= request.getParameter("ename");
		String comments= request.getParameter("comments");
		String content= request.getParameter("content");
		String[] ing_no= request.getParameterValues("ing_no");
		String[] unit= request.getParameterValues("unit");
		String[] volume= request.getParameterValues("volume");
		String[] alc= request.getParameterValues("alc");

		int totalAlc=0;
		int totalVolume=0;
		for(int i=0;i<volume.length;i++)
		{
			int isAlc=Integer.parseInt(alc[i].trim());
			int isVolume=Integer.parseInt(volume[i].trim());
			totalAlc+=(isAlc*isVolume);
			totalVolume+=isVolume;
		}
		int itAlc=totalAlc/totalVolume;
		CocktailVO vo = new CocktailVO();
		vo.setName(name);
		vo.setEname(ename);
		vo.setComments(comments);
		vo.setContent(content);
		vo.setAlc(String.valueOf(itAlc));
		vo.setId(id);
		vo.setImage("../img/illust_no_image.png");
		CocktailDAO.cocktailInsert(vo, ing_no, unit, volume);
		
		return"redirect:../cocktail/cocktail_my.do";
	}
	
	@RequestMapping("cocktail/ingredients_find_ajax.do")
	public void ingredients_find_ajax(HttpServletRequest request, HttpServletResponse response)
	{
		String fd = request.getParameter("fd");
		List<CocktailIngredientsVO> list = CocktailDAO.ingredientsFindData(fd);
		JSONArray arr = new JSONArray();
		int i = 0;
		for(CocktailIngredientsVO vo:list)
		{
			JSONObject obj=new JSONObject();
			obj.put("ing_no",vo.getIng_no());
			obj.put("ingname",vo.getIngname());
			obj.put("alc", vo.getAlc());
			
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
	
	@RequestMapping("cocktail/cocktail_delete.do")
	public String cocktail_delete(HttpServletRequest request, HttpServletResponse response)
	{
		String cno = request.getParameter("cno");
		request.setAttribute("cno", cno);
		return "../cocktail/cocktail_delete.jsp?cno="+cno;
	}
	@RequestMapping("cocktail/cocktail_delete_ok.do")
	public String cocktail_delete_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String cocktail_no = request.getParameter("cno");
		CocktailDAO.cocktailDelete(Integer.parseInt(cocktail_no));
		
		return "redirect:../cocktail/cocktail_list.do";
	}
	@RequestMapping("cocktail/cocktail_update.do")
	public String cocktail_update(HttpServletRequest request, HttpServletResponse response)
	{
		String cno = request.getParameter("cno");
		CocktailVO vo = CocktailDAO.cocktailDetailData(Integer.parseInt(cno));
		List<CocktailVO> list = CocktailDAO.cocktailRecipeData(Integer.parseInt(cno));
		List<CocktailVO> tags = CocktailDAO.cocktailTagData(Integer.parseInt(cno));
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		request.setAttribute("tags", tags);
		request.setAttribute("cno", cno);
		
		request.setAttribute("main_jsp", "../cocktail/cocktail_update.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("cocktail/cocktail_update_ok.do")
	public String cocktail_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String name= request.getParameter("name");
		String ename= request.getParameter("ename");
		String comments= request.getParameter("comments");
		String content= request.getParameter("content");
		String[] ing_no= request.getParameterValues("ing_no");
		String[] unit= request.getParameterValues("unit");
		String[] volume= request.getParameterValues("volume");
		String[] alc= request.getParameterValues("alc");
		String cocktail_no = request.getParameter("cno");
		
		int totalAlc=0;
		int totalVolume=0;
		for(int i=0;i<volume.length;i++)
		{
			int isAlc=Integer.parseInt(alc[i].trim());
			int isVolume=Integer.parseInt(volume[i].trim());
			totalAlc+=(isAlc*isVolume);
			totalVolume+=isVolume;
		}
		int itAlc=totalAlc/totalVolume;
		CocktailVO vo = new CocktailVO();
		vo.setName(name);
		vo.setEname(ename);
		vo.setComments(comments);
		vo.setContent(content);
		vo.setAlc(String.valueOf(itAlc));
		vo.setImage("../img/illust_no_image.png");
		CocktailDAO.cocktailUpdate(vo, ing_no, unit, volume,Integer.parseInt(cocktail_no));
		
		return"redirect:../cocktail/cocktail_detail.do?cno="+cocktail_no;
	}
}
