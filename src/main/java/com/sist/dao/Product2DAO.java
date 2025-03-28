package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;

public class Product2DAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	/*
	<select id="productListData" resultType="Product2VO" parameterType="hashmap">
		<!-- 	
	private int hit,jjimcount,likecount,replycount;
	private String name,price,poster,content,cno,delevery_fee; -->
		SELECT product_no,name,poster,price,cno,delivery_fee,num
		FROM (SELECT product_no,name,poster,price,cno,delivery_fee,rownum as num
		FROM (SELECT +INDEX_ASC(cocktail_product2 cp2_product_no_pk)product_no,name,poster,price,cno,delivery_fee
		FROM cocktail_product2))
		WHERE num BETWEEN #{start} AND #{end}
	</select>
	 */
	
	public static List<Product2VO> productListData(Map map)
	{
		
		SqlSession session=null;
		List<Product2VO> list=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("productListData",map);
		 }catch(Exception ex)
		 {
			  ex.printStackTrace();
		 }
		 finally
		 {
			 if(session!=null)
				 session.close();
		 }
		 return list;
	}
	public static int productTotalPage()
	{
		int total=0;
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			total=session.selectOne("productTotalPage");
			
	        //System.out.println("Total Pages: " + total);
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
	/*
	 * <select id="productDetailData" resultType="Product2VO" parameterType="int">
		SELECT * from cocktail_product2
		WHERE product_no=#{product_no}
	</select>
	 */
	public static Product2VO productDetailData(int product_no)
	{
		
		SqlSession session=ssf.openSession(true);
		session.update("productHitIncrement",product_no);
		Product2VO vo=session.selectOne("productDetailData",product_no);
		session.close();
		return vo;
	}
	public static Product2VO productCookieData(int product_no)
	{	SqlSession session=null;
		Product2VO vo=null;
		try
		{
			session = ssf.openSession();
			vo=session.selectOne("productDetailData",product_no);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return vo;
	}
	  public static List<Product2VO> RecommendData6()
	  {
		  SqlSession session=ssf.openSession();
		  List<Product2VO> list=session.selectList("RecommendData6");
		  session.close();
		  return list;
	  }
	  public static List<CocktailVO> RelatedData4()
	  {
		  SqlSession session=null;
		  List<CocktailVO> elist = null;
		  try
		  {
			session = ssf.openSession();
			elist=session.selectList("RelatedData4");
		  }
		  catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null) session.close();
		  }
		  return elist;
		
	  }

	  public static List<Product2VO> productFindData(Map map)
	  {
		  SqlSession session=null;
		  List<Product2VO> list=null;
		  try {
			  	session=ssf.openSession();
			  	list=session.selectList("productFindData",map);
			  
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }finally {
			  if(session!=null)
				  session.close();
		  }
		  return list;
		  
	  }
	  public static int productFindTotalPage(Map map)
		{
			
			SqlSession session=null;
			int total=0;
			try
			{
				session=ssf.openSession();
				total=session.selectOne("productFindTotalPage",map);
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
	  
	  public static int productTotalCount(Map map)
		{
			
			SqlSession session=null;
			int totalcount=0;
			try
			{
				session=ssf.openSession();
				totalcount=session.selectOne("productTotalCount",map);
			  }catch(Exception ex)
			  {
				  ex.printStackTrace();
			  }
			  finally
			  {
				  if(session!=null)
					  session.close();
			  }
			  return totalcount;
		}	
	  
	  
	  

	/*
	 *   <select id="productTotalCount" resultType="int" parameterType="hashmap">
   		SELECT COUNT(*) FROM cocktail_product2
 </select>
	 * */

}
