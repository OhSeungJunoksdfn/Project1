package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class NoticeDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   public static List<NoticeVO> noticeListData(Map map)
   {
 	  SqlSession session=ssf.openSession();
 	  List<NoticeVO> list=session.selectList("noticeListData",map);
 	  session.close();
 	  return list;
   }
   public static int noticeTotalPage()
   {
 	  SqlSession session=ssf.openSession();
 	  int total=session.selectOne("noticeTotalPage");
 	  session.close();
 	  return total;
   }
   public static void noticeInsert(NoticeVO vo)
   {
 	  SqlSession session=ssf.openSession(true);
 	  session.insert("noticeInsert",vo);
 	  session.close();
   }
   public static NoticeVO noticeDetailData(int no,int mode)
   {
 	  // 트랜잭션 
 	  SqlSession session=ssf.openSession();
 	  if(mode==1)
 	  {
 	   session.update("noticeHitIncrement",no);
 	   session.commit();
 	  }
 	  NoticeVO vo=session.selectOne("noticeDetailData",no);
 	  session.close();
 	  return vo;
   }
   public static void noticeUpdate(NoticeVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("noticeUpdate",vo);
	   session.close();
   }
   public static void noticeDelete(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   session.delete("noticeDelete",no);
	   session.close();
   }
}
