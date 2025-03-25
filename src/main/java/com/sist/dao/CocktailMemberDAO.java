package com.sist.dao;
import java.util.*;
import com.sist.vo.*;
import com.sist.commons.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class CocktailMemberDAO {
	private static SqlSessionFactory ssf;
	   static
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
	   /*
	    *  <select id="memberIdcheck" resultType="int" parameterType="string">
	       SELECT COUNT(*) FROM cocktail_member
	       WHERE id=#{id}
	       </select>
	       ============================================
	       SqlSession session=ssf.openSession();
		   int count=session.selectOne("memberIdcheck",id);
		   session.close();
		   return count;
	    */
	   public static int memberIdcheck(String id)
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("memberIdcheck",id);
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
		   return count;
	   }
	   /*
	    * <insert id="memberInsert" parameterType="CocktailMemberVO">
	      INSERT INTO cocktail_member VALUES(
	      #{id},#{pwd},#{name},#{sex},#{email},#{birthday},
	      #{post},#{address},#{address_detail},#{regdate},
	      #{coment},'n','y',#{phone},#{avater}
           )
          </insert>
	    */
	   public static void memberInsert(CocktailMemberVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session = ssf.openSession(true);
			   session.insert("memberInsert",vo);
		   }catch(Exception ex)
		   {
			  ex.printStackTrace(); 
		   }
		   finally
		   {
			   if(session != null)
				   session.close();
		   }
		
	   }
	   /*
	   <!-- 회원정보 -->
	   <select id="memberUpdateData" resultType="CocktailMemberVO" parameterType="string">
	    SELECT id,name,sex,email,birthday,post,address,address_detail,coment,phone,avatar
	    FROM cocktail_member
	    WHERE id=#{id}
	   </select>
	   */
	   
	   public static CocktailMemberVO memberUpdateData(String id)
	   {
		   CocktailMemberVO vo=new CocktailMemberVO();
	 	  SqlSession session=null;
	 	  try
	 	  {
	 		  session=ssf.openSession(true);
	 		  vo=session.selectOne("memberUpdateData", id);
	 	  }catch(Exception ex)
	 	  {
	 		  ex.printStackTrace();
	 	  }
	 	  finally
	 	  {
	 		  if(session!=null)
	 			  session.close();
	 	  }
		return vo;
	 	  
	 	 
	   }
	   /*
	    * <!-- 회원수정 -->
		  <select id="memberGetPassword" resultType="CocktailMemberVO" parameterType="string">
		   SELECT id,pwd,name,sex,email,admin
		   FROM cocktail_member
		   WHERE id=#{id}
		  </select>
  
		   <update id="memberUpdate" parameterType="CocktailMemberVO">
		  	UPDATE cocktail_member SET
		  	name=#{name},sex=#{sex},email=#{email},birthday=#{birthday},post=#{post},
		  	address=#{address},address_detail=#{address_detail},regdate=SYSDATE,
		  	coment=#{coment},phone=#{phone},avatar=#{avatar}
		  	WHERE id=#{id}
		  </update>
	    */
	   public static boolean memberUpdate(CocktailMemberVO vo)
	   {
	 	  boolean bCheck=false;
	 	  SqlSession session=null;
	 	  try
	 	  {
	 		  session=ssf.openSession();
	 		  String db_pwd=session.selectOne("memberGetPassword", vo.getId());
	 		  if(db_pwd.equals(vo.getPwd()))
	 		  {
	 			  bCheck=true;
	 			  session.update("memberUpdate",vo);
	 			  session.commit();
	 		  }
	 		  else
	 		  {
	 			  bCheck=false;
	 		  }
	 	  }catch(Exception ex)
	 	  {
	 		  ex.printStackTrace();
	 	  }
	 	  finally
	 	  {
	 		  if(session!=null)
	 			  session.close();
	 	  }
	 	  return bCheck;
	   }
	   
	   /*
	    * <update id="memberSecession" parameterType="string">
		  	UPDATE cocktail_member
		  	SET login = 'n'
		  	WHERE id = #{id}
		  	AND pwd=#{pwd}
		  	AND login = 'y' <!-- 탈퇴처리 로그 불가-->
		  </update>
	    */
	   public static void memberSecession(CocktailMemberVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session = ssf.openSession(true);
			   session.update("memberSecession",vo);
		   }catch(Exception ex)
		   {
			  ex.printStackTrace(); 
		   }
		   finally
		   {
			   if(session != null)
				   session.close();
		   }
		
	   }
	   /*
	   <!-- 회원삭제 -->
	   <delete id="deleteOldSecessionMembers">
	     DELETE FROM cocktail_member
	     WHERE login = 'n'
	     AND deletedate &lt;= ADD_MONTHS(SYSDATE, -3)
	   </delete>
	   <delete id="memberDelete" parameterType="CocktailMemberVO">
	     DELETE FROM cocktail_member
	     WHERE login = 'n'
	     AND id = #{id}
	   </delete>
	   */
	   public static void deleteOldSecessionMembers() {
		   
	        SqlSession session = null;
	        try 
	        {
	            session = ssf.openSession(true);
	            session.delete("deleteOldSecessionMembers");
	        } catch (Exception ex) 
	        {
	            ex.printStackTrace();
	        } finally 
	        {
	            if (session != null) 
	            	session.close();
	        }
	    }
	   
	   public static void memberDelete(CocktailMemberVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session = ssf.openSession(true);
			   session.delete("memberDelete",vo);
		   }catch(Exception ex)
		   {
			  ex.printStackTrace(); 
		   }
		   finally
		   {
			   if(session != null)
				   session.close();
		   }
		
	   }
	   
	   /*
	    * <select id="memberIdCheckCount" resultType="int" parameterType="string">
	      SELECT COUNT(*) FROM cocktail_member
	      WHERE id=#{id}
	      AND login='y'
	      </select>
	      <select id="memberGetPassword" resultType="MemberVO" parameterType="string">
	      SELECT id,pwd,name,sex,admin
	      FROM cocktail_member
	      WHERE id=#{id}
	      </select>
	    */
	   public static CocktailMemberVO memberLogin(String id,String pwd)
	   {
		   CocktailMemberVO mvo=new CocktailMemberVO();
		   SqlSession session=null;
		   
		   try
		   {
			   session=ssf.openSession();
			   int count = session.selectOne("memberIdCheckCount",id);
			   
			   if(count == 0) 
			   {
				 mvo.setMsg("NOID");   
			   }
			   else
			   {
				   mvo=session.selectOne("memberGetPassword",id);
			       if(mvo!=null && pwd.equals(mvo.getPwd())) 
			       {
			    	 mvo.setMsg("OK");   
			       }
			       else
			       {
			    	   mvo.setMsg("NOPWD");
			       }
			   }
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
			   mvo.setMsg("에러");
		   }
		   finally
		   {
			   if(session!=null)
			   {
				   session.close();
			   }
		   }
		   return mvo;
	   }
}
