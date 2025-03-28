package com.sist.model;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// [일반공지]
  @Controller
  public class NoticeModel {
      private String[] types = {"", "일반공지", "이벤트공지", "맛집공지", "여행공지", "레시피공지"};

      @RequestMapping("admin/notice_list.do")
      public String notice_list(HttpServletRequest request,
                                HttpServletResponse response) {
          try {
              String page = request.getParameter("page");
              if (page == null)
                  page = "1";

              int curpage = Integer.parseInt(page);
              Map map = new HashMap();
              map.put("start", (10 * curpage) - 9);
              map.put("end", 10 * curpage);

              List<NoticeVO> list = NoticeDAO.noticeListData(map);
              for (NoticeVO vo : list) {
                  vo.setTypes(types[vo.getType()]);
              }

              int count = NoticeDAO.noticeTotalPage();
              int totalpage = (int) (Math.ceil(count / 10.0));
              count = count - ((curpage * 10) - 10);

              request.setAttribute("list", list);
              request.setAttribute("totalpage", totalpage);
              request.setAttribute("curpage", curpage);
              request.setAttribute("count", count);
              request.setAttribute("admin_jsp", "../notice/notice_list.jsp");
              request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
              return "../main/main.jsp";

          } catch (Exception ex) {
              ex.printStackTrace(); // 예외 로그 출력
              request.setAttribute("msg", "공지사항 목록 처리 중 오류가 발생했습니다.");
              return "../main/main.jsp";
          }
      }
 

      @RequestMapping("admin/notice_insert.do")
      public String notice_insert(HttpServletRequest request,
                                  HttpServletResponse response) {
          try {
              request.setAttribute("admin_jsp", "../notice/notice_insert.jsp");
              request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
              return "../main/main.jsp";
          } catch (Exception ex) {
              ex.printStackTrace();
              request.setAttribute("msg", "공지사항 등록 페이지 이동 중 오류가 발생했습니다.");
              return "../main/main.jsp";
          }
      }
      @RequestMapping("notice/notice_insert_ok.do")
      public String notice_insert_ok(HttpServletRequest request,
                                     HttpServletResponse response) {
          try {
              request.setCharacterEncoding("UTF-8");

              String type = request.getParameter("type");
              String subject = request.getParameter("subject");
              String content = request.getParameter("content");

              NoticeVO vo = new NoticeVO();
              vo.setType(Integer.parseInt(type));
              vo.setSubject(subject);
              vo.setContent(content);

              NoticeDAO.noticeInsert(vo);

              return "redirect:../notice/notice_list.do";
          } catch (Exception ex) 
          {
              ex.printStackTrace();
              request.setAttribute("msg", "공지사항 등록 중 오류가 발생했습니다.");
              request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
              return "../main/main.jsp";
          }
      }

      @RequestMapping("adminpage/notice_detail.do")
      public String notice_detail(HttpServletRequest request,
                                  HttpServletResponse response) {
          try {
              String no = request.getParameter("no");
              NoticeVO vo = NoticeDAO.noticeDetailData(Integer.parseInt(no), 0);
              vo.setTypes(types[vo.getType()]);

              request.setAttribute("vo", vo);
              request.setAttribute("admin_jsp", "../notice/notice_detail.jsp");
              request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
          } catch (Exception ex) {
              ex.printStackTrace();
          }
          return "../main/main.jsp";
      }


      @RequestMapping("notice/notice_update.do")
      public String notice_update(HttpServletRequest request,
                                  HttpServletResponse response) {
          try {
              String no = request.getParameter("no");
              NoticeVO vo = NoticeDAO.noticeDetailData(Integer.parseInt(no), 0);
              request.setAttribute("vo", vo);
              request.setAttribute("admin_jsp", "../notice/notice_update.jsp");
              request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
          } catch (Exception ex) {
              ex.printStackTrace();
          }
          return "../main/main.jsp";
      }

      @RequestMapping("admin/notice_update_ok.do")
      public String notice_update_ok(HttpServletRequest request,
                                     HttpServletResponse response) {
          String no = request.getParameter("no");
          try {
              String type = request.getParameter("type");
              String subject = request.getParameter("subject");
              String content = request.getParameter("content");

              NoticeVO vo = new NoticeVO();
              vo.setType(Integer.parseInt(type));
              vo.setSubject(subject);
              vo.setContent(content);
              vo.setNo(Integer.parseInt(no));

              NoticeDAO.noticeUpdate(vo);
          } catch (Exception ex) 
          {
        	  ex.printStackTrace();
          }
          return "redirect:../admin/notice_detail.do?no=" + no;
      }

      @RequestMapping("admin/notice_delete.do")
      public String notice_delete(HttpServletRequest request,HttpServletResponse response) 
      {
          try {
              String[] nos = request.getParameterValues("dbox");
              if (nos != null) {
                  for (String no : nos) {
                      NoticeDAO.noticeDelete(Integer.parseInt(no));
                  }
              }
          } catch (Exception ex) 
          {
        	  ex.printStackTrace();
          }
          return "redirect:../admin/notice_list.do";
      }
}