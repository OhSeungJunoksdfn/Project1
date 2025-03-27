package com.sist.dao;
/*
 *   <insert id="cartInsert" parameterType="CartVO">
    INSERT INTO cart VALUES(
      cart_cno_seq.nextval,#{gno},#{id},#{account},
      #{price},'n',SYSDATE
    )
  </insert>
  select id="cartListData" resultMap="cartMap" 
     parameterType="string">
    SELECT cno,goods_name,goods_poster,goods_price,
           account,price
    FROM cart c,goods_all g
    WHERE c.gno=g.no
    AND id=#{id} AND isbuy='n'
  </select>
  <update id="cartUpdate" parameterType="hashmap">
    UPDATE cart SET
    account=account+#{account}
    WHERE gno=#{gno} AND id=#{id}
  </update>
  <delete id="cartCancel" parameterType="int">
    DELETE FROM cart
    WHERE cno=#{cno}
  </delete>
  
   <bean id="ssf" class="org.mybatis.spring.SqlSessionFactoryBean"
      p:dataSource-ref="ds"
    />
     * <bean id="dao" ...
     *   p:sqlSessionFactory-ref="ssf"
     * >
     * <bean id="dao" ...
     *   p:sqlSessionFactory-ref="ssf"
     * >
     */
 
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class Cart2DAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *  SqlSession session=ssf.openSession();
		  
	   session.close();
		  
    */
   public static void cartInsert2(Cart2VO vo)
   {
	      SqlSession session=ssf.openSession(true);
	      int count=session.selectOne("cartCount2",vo);
	      if(count==0)
	      {
		     session.insert("cartInsert2",vo);
	      }
	      else
	      {
	    	  session.update("cartUpdate2",vo);
	      }
		  session.close();
		  
   }
   public static List<Cart2VO> cartListData2(String id)
   {
	   SqlSession session=ssf.openSession();
	   List<Cart2VO> list=session.selectList("cartListData2", id);
	   session.close();
	   return list;
   }
   

   public static List<Cart2VO> buyListData2(String id)
   {
	   SqlSession session=ssf.openSession();
	   List<Cart2VO> list=session.selectList("buyListData2", id);
	   session.close();
	   return list;
   }
   
   public static void cartCancel2(int cno)
   {
	      SqlSession session=ssf.openSession(true);
	      try
	      {
		  session.delete("cartCancel2",cno);
	      }catch(Exception ex)
	      {
	    	  ex.printStackTrace();
	      }
		  session.close();
		  
   }
   
 
   public static void buyInsert(Cart2VO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("buyInsert",vo);
	   session.close();
   }
   
   
}


