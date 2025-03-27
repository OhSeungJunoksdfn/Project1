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
	   public static boolean memberUpdate(CocktailMemberVO vo) {
		    boolean bCheck = false;
		    SqlSession session = null;
		    try {
		        session = ssf.openSession();

		        String id = vo.getId();
		        if (id == null || id.trim().isEmpty()) {
		            return false;
		        }

		        String db_pwd = session.selectOne("memberGetPassword1", id);

		        if (db_pwd != null && db_pwd.equals(vo.getPwd())) {
		            session.update("memberUpdate", vo);
		            session.commit();
		            bCheck = true;
		        } else {
		            bCheck = false;
		        }
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } finally {
		        if (session != null) session.close();
		    }
		    return bCheck;
		}
	   
	   /*
	    * <!-- 아이디 찾기 -->
	    * <select id="memberIdFindData" resultType="String" parameterType="CocktailMemberVO">
		   SELECT RPAD(SUBSTR(id,1,2),LENGTH(id),'*') FROM cocktail_member
		   WHERE name=#{name} AND email=#{email}
		  </select>
		  <select id="memberGetEmailData" resultType="string" parameterType="string">
		    SELECT COUNT(*) FROM cocktail_member
		    WHERE email=#{email}
		  </select>
	    */
	   public static String memberIdFindData(CocktailMemberVO vo) 
	   {
		    String result = "";
		    SqlSession session = null;
		    
		    try {
		        session = ssf.openSession();
		        int count = session.selectOne("memberIdFindCount", vo);
		        
		        if (count == 0) 
		        {
		            result = "no";
		        } 
		        else 
		        {
		            result = session.selectOne("memberIdFindData", vo);
		        }
		    } catch (Exception ex) 
		    {
		        ex.printStackTrace();
		    } finally 
		    {
		        if (session != null) 
		        {
		            session.close();
		        }
		    }
		    
		    return result;
		}
	   
	   public static String memberGetEmailData(String email) 
	   {
		    String result = "0";
		    SqlSession session = null;

		    try {
		        session = ssf.openSession();
		        result = session.selectOne("memberGetEmailData", email);
		    } catch (Exception ex)
		    {
		        ex.printStackTrace();
		    } finally 
		    {
		        if (session != null) 
		        	session.close();
		    }

		    return result;
		}
	   /*
	    * <select id="memberPwdFindCount" resultType="int" parameterType="string">
		   SELECT COUNT(*) FROM cocktail_member
		   WHERE id=#{id}
		  </select>
		  <select id="memberPwdFindData" resultType="String" parameterType="string">
		   SELECT pwd FROM cocktail_member
		   WHERE id=#{id}
		  </select>
	    */
	   public static String memberPwdFindData(String id)
	   {
	 	  String result="";
	 	  SqlSession session=null;
	 	  try
	 	  {
	 		  session=ssf.openSession();
	 		  int count=session.selectOne("memberPwdFindCount",id);
	 		  if(count==0)
	 		  {
	 			  result="no";
	 		  }
	 		  else
	 		  {
	 			  String pwd=session.selectOne("memberPwdFindData",id);
	 			  result=pwd;
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
	 	  return result;
	   }
	   /*
	    * <select id="pwdCheckData" resultType="int" parameterType="hashmap">
		   SELECT COUNT(*) FROM cocktail_member
		   WHERE id=#{id} 
		   AND pwd=#{pwd}
		  </select>
		  <update id="pwdChange" parameterType="hashmap">
		   UPDATE cocktail_member SET
		   pwd=#{pwd}
		   WHERE id=#{id}
		  </update>
	    */
	   public static int pwdCheckData(Map map)
	   {
	 	  int count=0;
	 	  SqlSession session=null;
	 	  try
	 	  {
	 		  session=ssf.openSession();
	 		  count=session.selectOne("pwdCheckData",map);
	 	  }catch(Exception ex)
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
	   public static void pwdChange(Map map)
	   {
	 	  SqlSession session=null;
	 	  try
	 	  {
	 		  session=ssf.openSession(true);
	 		  session.update("pwdChange",map);
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
	
	   /*
	   <!-- 회원 비밀번호 확인 -->
		<select id="memberGetPassword2" resultType="string" parameterType="string">
		  SELECT pwd FROM cocktail_member
		  WHERE id = #{id, jdbcType=VARCHAR}
		</select>
		
		<!-- 회원 상태 변경 (탈퇴 처리) -->
		<update id="memberSecession" parameterType="CocktailMemberVO">
		  UPDATE cocktail_member
		  SET login = 'n'
		  WHERE id = #{id}
		  AND pwd = #{pwd}
		  AND login = 'y'
		</update>
		
		<!-- 3개월 이상 된 탈퇴 회원 삭제 -->
		<delete id="deleteOldSecessionMembers">
		  DELETE FROM cocktail_member
		  WHERE login = 'n'
		  AND deletedate <= ADD_MONTHS(SYSDATE, -3)
		</delete>
		
		<!-- 관리자가 수동으로 회원 삭제할 때 (login이 'n'인 경우만) -->
		<delete id="memberDelete" parameterType="CocktailMemberVO">
		  DELETE FROM cocktail_member
		  WHERE login = 'n'
		  AND id = #{id}
		</delete>
	   */
	   public static String getPassword(String id) {
	        String pwd = "";
	        SqlSession session = null;
	        try {
	            session = ssf.openSession();
	            pwd = session.selectOne("memberGetPassword2", id);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (session != null)
	                session.close();
	        }
	        return pwd;
	    }
	   
	   public static void memberSecession(CocktailMemberVO vo) {
	        SqlSession session = null;
	        try {
	            session = ssf.openSession(true); // auto commit
	            session.update("memberSecession", vo);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (session != null)
	                session.close();
	        }
	    }
	   
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
