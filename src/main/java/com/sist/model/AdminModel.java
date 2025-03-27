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
   @RequestMapping("admin/admin_main.do")
   public String adminpage_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("admin_jsp", "../admin/admin_home.jsp");
	   request.setAttribute("main_jsp", "../admin/admin_main.jsp");
	   return "../main/main.jsp";
   }
  
}