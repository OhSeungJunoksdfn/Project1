package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.CommunityCommentDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CommunityCommentModel {
	private Map urlMap = new HashMap<String, String>() {{
        put("freeboard", "community/freeboard_detail.do?board_no=");
        put("cocktail", "cocktail/cocktail_detail.do?cno=");
        put("cocktailbar", "cocktailbar/cocktailbar_detail.do?bar_no=");
    }};
	@RequestMapping("comment/comment_insert.do")//댓글 쓰기
	public String comment_insert(HttpServletRequest request, HttpServletResponse response)
	{	
		
		String page=request.getParameter("page");
		if(page==null||page.length()==0)
			page="1";
		
		String post_no=request.getParameter("post_no");
		String id=request.getParameter("id");
		String content=request.getParameter("content");
		String is_reply=request.getParameter("is_reply");
		String post_type=request.getParameter("post_type");
		
		System.out.println("post_typeeeeeeeeeeee"+post_type);
		
		Map map = new HashMap();
		map.put("post_no", post_no);
		map.put("id", id);
		map.put("content",content);
		map.put("is_reply", is_reply);
		map.put("post_type", post_type);
		
		CommunityCommentDAO.insertComment(map);
		
		return "redirect:../"+urlMap.get(post_type)+post_no+"&page="+page;
	}
	
	@RequestMapping("comment/comment_insert_reply.do")//댓글에 답글 쓰기
	public String comment_insert_reply(HttpServletRequest request, HttpServletResponse response)
	{	
		
		String page=request.getParameter("page");
		if(page==null||page.length()==0)
			page="1";
		
		String post_no=request.getParameter("post_no");
		String id=request.getParameter("id");
		String content=request.getParameter("content");
		String is_reply=request.getParameter("is_reply");
		String group_id=request.getParameter("group_id");
		String post_type=request.getParameter("post_type");
		
		Map map = new HashMap();
		map.put("post_no", post_no);
		map.put("id", id);
		map.put("content",content);
		map.put("is_reply", is_reply);
		map.put("group_id", group_id);
		map.put("post_type", post_type);
		
		CommunityCommentDAO.insertCommentReply(map);
		
		return "redirect:../"+urlMap.get(post_type)+post_no+"&page="+page;
	}
	
	@RequestMapping("comment/comment_delete.do")
	public String comment_delete(HttpServletRequest request, HttpServletResponse response)
	{	
		
		String page=request.getParameter("page");
		if(page==null||page.length()==0)
			page="1";
		
		String comment_no=request.getParameter("comment_no");
		String post_no=request.getParameter("post_no");
		String id=request.getParameter("id");
		String post_type=request.getParameter("post_type");
		
		CommunityCommentDAO.deleteComment(Integer.parseInt(comment_no));
		
		return "redirect:../"+urlMap.get(post_type)+post_no+"&page="+page;
	}
	
	@RequestMapping("comment/comment_update.do")//댓글에 답글 쓰기
	public String comment_update(HttpServletRequest request, HttpServletResponse response)
	{	
		
		String page=request.getParameter("page");
		if(page==null||page.length()==0)
			page="1";
		
		String comment_no=request.getParameter("comment_no");
		String content=request.getParameter("content");
		String post_no=request.getParameter("post_no");
		String post_type=request.getParameter("post_type");
		String id=request.getParameter("id");
		
		Map map=new HashMap();
		
		map.put("comment_no", Integer.parseInt(comment_no));
		map.put("content", content);
		
		CommunityCommentDAO.updateComment(map);
		
		return "redirect:../"+urlMap.get(post_type)+post_no+"&page="+page;
	}
}
