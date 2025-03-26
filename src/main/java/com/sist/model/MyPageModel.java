package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageModel {
  @RequestMapping("mypage/my_main.do")
  public String my_main(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  request.setAttribute("my_jsp", "../mypage/my_home.jsp");
	  request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	  return "../main/main.jsp";
  }
  
  @RequestMapping("member/join_update.do")
  public String mypage_join_update(HttpServletRequest request,HttpServletResponse response)
  {
	  try {
	        HttpSession session = request.getSession();
	        String id = (String) session.getAttribute("id");
	        CocktailMemberVO vo = CocktailMemberDAO.memberUpdateData(id);
	        String phone=vo.getPhone();
	 	    phone=phone.substring(phone.indexOf(")")+1);
	 	    vo.setPhone(phone);
	        request.setAttribute("vo", vo);
	        request.setAttribute("title","회원 수정");
	        request.setAttribute("my_jsp", "../member/join_update.jsp");
	        request.setAttribute("main_jsp", "../mypage/my_main.jsp");
	        return "../main/main.jsp";

	    } catch (Exception ex) {
	        ex.printStackTrace();
	        return "../member/error.jsp";
	    }
	}
  
  @RequestMapping("member/join_update_ok.do")
  public String mypage_join_update_ok(HttpServletRequest request,HttpServletResponse response)
  {
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

	        boolean bCheck = CocktailMemberDAO.memberUpdate(vo);
	        

	        if (bCheck) 
	        {
	        	response.setContentType("text/html;charset=UTF-8");
	            java.io.PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("alert('회원수정이 완료되었습니다. 다시 로그인부탁드립니다.');");
	            out.println("location.href='../member/login.do';");
	            out.println("</script>");
	            return null;
	        } else {
	            request.setAttribute("msg", "비밀번호가 일치하지 않아 수정에 실패했습니다.");
	            request.setAttribute("vo", vo);
	            request.setAttribute("main_jsp", "../member/join_update.jsp");
	            return "../main/main.jsp";
	        }

	    } catch (Exception ex) {
	        ex.printStackTrace();
	        request.setAttribute("error_message", "회원 정보 수정 중 오류 발생");
	        return "../member/error.jsp";
	    }

  }
  
}