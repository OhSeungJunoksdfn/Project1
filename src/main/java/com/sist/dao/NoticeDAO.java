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
   /*
    *  <!--  admin  -->
	  <select id="noticeListData" resultType="NoticeVO" parameterType="hashmap">
	    SELECT no,type,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,num
	    FROM (SELECT no,type,subject,name,regdate,hit,rownum as num 
	    FROM (SELECT no,type,subject,name,regdate,hit
	    FROM cocktail_notice ORDER BY no DESC))
	    WHERE num BETWEEN #{start} AND #{end}
	  </select>
	  <select id="noticeTotalPage" resultType="int">
	   SELECT COUNT(*) FROM cocktail_notice
	  </select>
	  <insert id="noticeInsert" parameterType="NoticeVO">
	   INSERT INTO cocktail_notice(no,type,subject,content) VALUES(
	    pn_no_seq.nextval,#{type},#{subject},#{content})
	 </insert>
    */
   public static List<NoticeVO> noticeListData(Map map)
   {
	   SqlSession session=null;
	   List<NoticeVO> list=new ArrayList<>();
	   try
	   {
		   session = ssf.openSession();
		   list=session.selectList("noticeListData",map);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null) session.close();
	   }
	   return list;
   }
  
   public static int noticeTotalPage()
   {
	   SqlSession session=null;
	   int total=0;
	   try
	   {
		   session = ssf.openSession();
		   total=session.selectOne("noticeTotalpage");
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return total;
   }
   public static void noticeInsert(NoticeVO vo)
   {
 	  SqlSession session=null;
 	  try
 	  {
 		  session=ssf.openSession(true);
 		 session.insert("noticeInsert",vo);
 	  }
 	  catch(Exception ex)
 	  {
 		  ex.printStackTrace();
 	  }
 	  finally
 	  {
 		 if(session!=null)	
 		  session.close();
 	  }
   }
   /*
    *  <insert id="noticeInsert" parameterType="NoticeVO">
	   INSERT INTO cocktail_notice(no,type,subject,content) VALUES(
	   pn_no_seq.nextval,#{type},#{subject},#{content})
	  </insert>
	 <update id="noticeHitIncrement" parameterType="int">
	  UPDATE cocktail_notice SET
	  hit=hit+1
	  WHERE no=#{no}
	 </update>
    */
   public static NoticeVO noticeDetailData(int no,int mode)
   {
	   SqlSession session=null;
	   NoticeVO vo=null;
	   
	   try
	   {
		   session=ssf.openSession();
		   
		   if(mode==1) {
			   session.update("noticeHitInCrement",no);
			   session.commit();
		   }
		   
		   vo = session.selectOne("noticeDetailData", no);
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session !=null )
			   session.close();
	   }
	   return vo;
   }

	   
 	  /*
 	   * <update id="noticeUpdate" parameterType="NoticeVO">
		   UPDATE cocktail_notice SET
		   type=#{type},subject=#{subject},content=#{content}
		   WHERE no=#{no}
		 </update>
		 <delete id="noticeDelete" parameterType="int">
		   DELETE FROM cocktail_notice
		   WHERE no=#{no}
		 </delete>
		</mapper>
 	   */
	   public static void noticeUpdate(NoticeVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("noticeUpdate",vo);
		   }
		   catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   public static void noticeDelete(int no)
	   {	
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("noticeDelete",no);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
   }
	   
