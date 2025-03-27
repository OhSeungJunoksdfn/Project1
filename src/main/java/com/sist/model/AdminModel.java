package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class AdminModel {
   @RequestMapping("adminpage/admin_main.do")
   public String adminpage_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
	   request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("adminpage/blacklist.do")
   public String admin_blacklist(HttpServletRequest request,
                                 HttpServletResponse response) {
       List<BlackListVO> list = BlackListDAO.getBlacklist();
       request.setAttribute("list", list);
       request.setAttribute("admin_jsp", "../adminpage/blacklist.jsp");
       request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
       return "../main/main.jsp";
   }

   @RequestMapping("adminpage/blacklist_insert.do")
   public String admin_blacklist_insert(HttpServletRequest request,
                                        HttpServletResponse response) {
       try {
           request.setCharacterEncoding("UTF-8");
           String id = request.getParameter("id");
           String name = request.getParameter("name");
           String email = request.getParameter("email");
           String reason = request.getParameter("reason");

           BlackListVO vo = new BlackListVO();
           vo.setId(id);
           vo.setName(name);
           vo.setEmail(email);
           vo.setReason(reason);

           BlackListDAO.insertBlacklist(vo);
       } catch (Exception ex) {
           ex.printStackTrace();
       }

       return "redirect:blacklist.do";
   }

   @RequestMapping("adminpage/blacklist_delete.do")
   public String admin_blacklist_delete(HttpServletRequest request,
                                        HttpServletResponse response) {
       try {
           int no = Integer.parseInt(request.getParameter("black_list_no"));
           BlackListDAO.deleteBlacklist(no);
       } catch (Exception ex) {
           ex.printStackTrace();
       }
       return "redirect:blacklist.do";
   }
}
  