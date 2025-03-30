package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CommunityCommentDAO;
import com.sist.dao.CommunityDAO;
import com.sist.dao.CommunityManageDAO;
import com.sist.vo.CommunityCommentVO;
import com.sist.vo.CommunityFreeboardVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class CommunityManageModel {
	
	@RequestMapping("community_manage/post_manage.do")
	public String post_manage(HttpServletRequest request, HttpServletResponse response)
	{	
		
		try {
			
			String id=request.getParameter("id");
			String page=request.getParameter("page");
			if(page==null||page.length()==0)
				page="1"; // default page
			
			Map map=new HashMap();
			int curpage=Integer.parseInt(page);
			map.put("start", (curpage*10)-9);
			map.put("end", curpage*10);
			map.put("id",id);
			
			int totalpage=CommunityManageDAO.boardTotalPage(id);
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			if(endPage>totalpage)
				endPage=totalpage;
			
			List<CommunityFreeboardVO> list=CommunityManageDAO.boardListData(map);
			
			
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
			request.setAttribute("MP_JSP", "../community_manage/post_manage.jsp");
			request.setAttribute("my_jsp", "../mypage/my_home.jsp");
			request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("community_manage/post_delete.do")
	public String post_delete(HttpServletRequest request, HttpServletResponse response)
	{	
		String deleteList=request.getParameter("delete_list");
		String page=request.getParameter("page");
		String id=request.getParameter("id");
		try {
			if(page==null||page.length()==0)
				page="1";
			
			CommunityManageDAO.postDelete(deleteList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:../community_manage/post_manage.do?page="+page+"&id="+id;
	}
	
	@RequestMapping("community_manage/comment_manage.do")
	public String comment_manage(HttpServletRequest request, HttpServletResponse response)
	{	
		
		try {
			
			String id=request.getParameter("id");
			String page=request.getParameter("page");
			if(page==null||page.length()==0)
				page="1"; // default page
			
			Map map=new HashMap();
			int curpage=Integer.parseInt(page);
			map.put("start", (curpage*10)-9);
			map.put("end", curpage*10);
			map.put("id",id);
			
			int totalpage=CommunityManageDAO.commentTotalPage(id);
			final int BLOCK=10;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			if(endPage>totalpage)
				endPage=totalpage;
			
			List<CommunityCommentVO> list=CommunityManageDAO.commentListData(map);
			
			request.setAttribute("curpage", curpage);
			request.setAttribute("totalpage", totalpage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
			request.setAttribute("MP_JSP", "../community_manage/comment_manage.jsp");
			request.setAttribute("my_jsp", "../mypage/my_home.jsp");
			request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("community_manage/comment_delete.do")
	public String comment_delete(HttpServletRequest request, HttpServletResponse response)
	{	
		String deleteList=request.getParameter("delete_list");
		String page=request.getParameter("page");
		String id=request.getParameter("id");
		try {
			if(page==null||page.length()==0)
				page="1";
			
			CommunityManageDAO.commentDelete(deleteList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:../community_manage/comment_manage.do?page="+page+"&id="+id;
	}
}
