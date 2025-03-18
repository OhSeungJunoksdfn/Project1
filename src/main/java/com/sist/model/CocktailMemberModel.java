package com.sist.model;
import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CocktailMemberModel {
	 @RequestMapping("member/join.do")
	   public String member_join(HttpServletRequest request,HttpServletResponse response) {
	   try {
	        // include
	        request.setAttribute("main_jsp", "../member/join.jsp");
	        return "../main/main.jsp";
	    } catch (Exception ex) 
	   {
	        ex.printStackTrace(); // 예외 로그 출력
	        request.setAttribute("error_message", "An error occurred while processing your request.");
	        return "../member/error.jsp"; // 오류 발생 시 이동할 페이지
	    }
	}
	 @RequestMapping("member/idcheck.do")
	   public String member_idcheck(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   return "../member/idcheck.jsp";
	   }
	 
	 @RequestMapping("member/idcheck_ok.do")
	   public void member_idcheck_ok(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   // void => 일반 데이터 (String , int)
		   // => JSON
		   // data:{"id":id.trim()} ?id=aaa
		   String id=request.getParameter("id");
		   int count=CocktailMemberDAO.memberIdcheck(id);
		   
		   try
		   {
			   response.setContentType("text/html;charset=UTF-8");
			   PrintWriter out=response.getWriter();
			   out.write(String.valueOf(count));
		   }catch(Exception ex) 
		   {
			   ex.printStackTrace();
		   }
		   
	   }
	 
	 @RequestMapping("member/join_ok.do")
	   // MemberVO vo
	   public String member_join_ok(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String id=request.getParameter("id");
		   String pwd=request.getParameter("pwd");
		   String name=request.getParameter("name");
		   String sex=request.getParameter("sex");
		   String birthday=request.getParameter("birthday");
		   String email=request.getParameter("email");
		   String post=request.getParameter("post");
		   String address=request.getParameter("address");
		   String address_detail=request.getParameter("address_detail");
		   String phone1=request.getParameter("phone1");
		   String phone2=request.getParameter("phone2");
		   String coment=request.getParameter("coment");
		   String avatar=request.getParameter("avatar");
		   
		   CocktailMemberVO vo=new CocktailMemberVO
				   ();
		   vo.setId(id);
		   vo.setPwd(pwd);
		   vo.setName(name);
		   vo.setSex(sex);
		   vo.setBirthday(birthday);
		   vo.setEmail(email);
		   vo.setPost(post);
		   vo.setAddress(address);
		   vo.setAddress_detail(address_detail);
		   vo.setPhone(phone1+"-"+phone2);
		   vo.setComent(coment);
		   vo.setAvatar(avatar);
		   CocktailMemberDAO.memberInsert(vo);
		   
		   return "redirect:../main/main.do";
	   }
	   
	 
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request,
			   HttpServletResponse response)
	{
		//include
		try
		{
			request.setAttribute("main_jsp", "../member/login.jsp");
			return "../main/main.jsp";
		}catch(Exception ex) 
		{
		   ex.printStackTrace();
		   return "../member/error.jsp";
		}
	}
	 // 로그인 
	   @RequestMapping("member/login_ok.do")
	   public void member_login_ok(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   String id=request.getParameter("id");
		   String pwd=request.getParameter("pwd");
		   CocktailMemberVO vo=CocktailMemberDAO.memberLogin(id, pwd);
		   if(vo.getMsg().equals("OK"))
		   {
			   HttpSession session=request.getSession();
			   session.setAttribute("id", vo.getId());
			   session.setAttribute("name", vo.getName());
			   session.setAttribute("sex", vo.getSex());
			   session.setAttribute("admin", vo.getAdmin());
			   session.setAttribute("post", vo.getPost());
			   session.setAttribute("address", vo.getAddress());
			   session.setAttribute("address_detail", vo.getAddress_detail());
			   session.setAttribute("phone", vo.getPhone());
		   }
		   try
		   {
			   response.setContentType("text/html;charset=UTF-8");
			   PrintWriter out=response.getWriter();
			   out.write(vo.getMsg());
		   }catch(Exception ex) 
		   {
			   ex.printStackTrace();
		   }
	   }
	// 로그아웃 
	   @RequestMapping("member/logout.do")
	   public String member_logout(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   HttpSession session=request.getSession();
		   session.invalidate();
		   return "redirect:../main/main.do";
	   }
	}

