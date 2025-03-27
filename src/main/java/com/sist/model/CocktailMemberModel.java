package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.manager.MailManager;
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
	                              HttpServletResponse response) {
	     try {
	         request.setCharacterEncoding("UTF-8");

	         String id = request.getParameter("id");
	         String pwd = request.getParameter("pwd");
	         String name = request.getParameter("name");
	         String sex = request.getParameter("sex");
	         String birthday = request.getParameter("birthday");
	         String email = request.getParameter("email");
	         String post = request.getParameter("post");
	         String address = request.getParameter("address");
	         String address_detail = request.getParameter("address_detail");
	         String phone1 = request.getParameter("phone1");
	         String phone2 = request.getParameter("phone2");
	         String coment = request.getParameter("coment");
	         String avatar = request.getParameter("avatar");

	         CocktailMemberVO vo = new CocktailMemberVO();
	         vo.setId(id);
	         vo.setPwd(pwd);
	         vo.setName(name);
	         vo.setSex(sex);
	         vo.setBirthday(birthday);
	         vo.setEmail(email);
	         vo.setPost(post);
	         vo.setAddress(address);
	         vo.setAddress_detail(address_detail);
	         vo.setPhone(phone1 + "-" + phone2);
	         vo.setComent(coment);
	         vo.setAvatar(avatar);

	         CocktailMemberDAO.memberInsert(vo);
	         HttpSession session = request.getSession();
	         session.setAttribute("msg", "회원가입이 완료되었습니다!");

	         return "redirect:../main/main.do";
	     } catch (Exception e) {
	         e.printStackTrace();
	         request.setAttribute("error_message", "회원가입 중 오류가 발생했습니다.");

	         // Shadowbox로 열릴 페이지
	         request.setAttribute("main_jsp", "../member/error.jsp");
	         return "../main/main.jsp";
	     }
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
			   session.setAttribute("email", vo.getEmail());
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
	   @RequestMapping("member/idfind.do")
	   public String member_idfind(HttpServletRequest request,HttpServletResponse response)
	   {
	 	  request.setAttribute("main_jsp", "../member/idfind.jsp");
	 	  return "../main/main.jsp";
	   }
	   
	   @RequestMapping("member/idfind_ok.do")
	   public void member_idfind_ok(HttpServletRequest request,HttpServletResponse response)
	   {
	 	  String name=request.getParameter("name");
	 	  String email=request.getParameter("email");
	 	  
	 	 CocktailMemberVO vo=new CocktailMemberVO();
	 	  vo.setName(name);
	 	  vo.setEmail(email);
	 	  // 데이터베이스 연동 
	 	  String result=CocktailMemberDAO.memberIdFindData(vo);
	 	  // Ajax로 값 전송 
	 	  try
	 	  {
	 		  PrintWriter out=response.getWriter();
	 		  out.write(result);
	 	  }catch(Exception ex) 
	 	  {
	 		  ex.printStackTrace();
	 	  }
	   }
	   @RequestMapping("member/pwdfind.do")
	   public String member_pwdfind(HttpServletRequest request,HttpServletResponse response)
	   {
	 	  request.setAttribute("main_jsp", "../member/pwdfind.jsp");
	 	  return "../main/main.jsp";
	   }
	   @RequestMapping("member/pwdfind_ok.do")
	   public void member_pwdfind_ok(HttpServletRequest request,HttpServletResponse response)
	   {
	 	  String id=request.getParameter("id");
	 	  String result=CocktailMemberDAO.memberPwdFindData(id);
	 	  if(!result.equals("no"))
	 	  {
	 		  MailManager m=new MailManager();
	 		  m.mailSender(result);
	 	  }
	 	  
	 	  try
	 	  {
	 		  PrintWriter out=response.getWriter();
	 		  out.write(result);
	 	  }catch(Exception ex) {}
	   }
	   
	   @RequestMapping("member/pwd_change.do")
	   public String member_pwd_change(HttpServletRequest request,HttpServletResponse response)
	   {
	 	  request.setAttribute("title", "비밀번호 변경");
	 	  request.setAttribute("mypage_jsp", "../member/pwdChange.jsp");
	 	  request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	 	  return "../main/main.jsp";
	   }
	   @RequestMapping("member/pwd_change_ok.do")
	   public String member_pwd_change_ok(HttpServletRequest request,HttpServletResponse response)
	   {
	 	  HttpSession session=request.getSession();
	 	  String id=(String)session.getAttribute("id");
	 	  String opwd=request.getParameter("old_pwd");
	 	  String npwd=request.getParameter("new_pwd");
	 	  // 데이터베이스 연동 
	 	  Map map=new HashMap();
	 	  map.put("id", id);
	 	  map.put("pwd", opwd);
	 	  int count=CocktailMemberDAO.pwdCheckData(map);
	 	  if(count!=0)
	 	  {
	 		  map=new HashMap();
	 		  map.put("id", id);
	 		  map.put("pwd", npwd);
	 		  CocktailMemberDAO.pwdChange(map);
	 		  session.invalidate();
	 	  }
	 	  request.setAttribute("count", count);
	 	  return "../member/pwdChange_ok.jsp";
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

