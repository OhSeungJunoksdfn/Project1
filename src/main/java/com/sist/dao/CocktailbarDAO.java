package com.sist.dao;

import java.util.*;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.CocktailbarVO;


public class CocktailbarDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static CocktailbarVO cocktailbarHouseData()
	{
		SqlSession session = ssf.openSession();
		CocktailbarVO vo = session.selectOne("cocktailbarHouseData");
		session.close();
		return vo;
	}
	public static List<CocktailbarVO> cocktailbarHouseData12()
	{
		SqlSession session = null;
		List<CocktailbarVO> list = null;
		try {
			session=ssf.openSession();
			list=session.selectList("cocktailbarHouseData12");
		} catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
	/*
	 <select id="cocktailbarListData" resultType="CocktailbarVO" parameterType="hashmap">
  SELECT bar_no,name,address,phone,image,profile,hit,time,loc,subway,num
  FROM (SELECT bar_no,name,address,phone,image,profile,hit,time,loc,subway,rownum as num 
  FROM (SELECT + INDEX_ASC(cocktailbar cb_bar_no_pk)bar_no,name,address,phone,image,profile,hit,time,loc,subway
  FROM cocktailbar))
  WHERE num BETWEEN #{start} AND #{end}
 </select>
 <select id="cocktailbarTotalPage" resultType="int">
  SELECT CEIL(COUNT(*)/12.0) FROM cocktailbar
 </select>
	 */
	public static List<CocktailbarVO> cocktailbarListData(Map map)
	{
		SqlSession session = null;
		List<CocktailbarVO> list = null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("cocktailbarListData",map);
		}
		catch (Exception ex) 
		{
		 ex.printStackTrace();
		}
		finally 
		{
			if(session!=null) session.close();
		}
		return list;
	}
	public static int cocktailbarTotalPage()
	{
		SqlSession session = null;
		int total = 0;
	try
	{
		session=ssf.openSession();
		total=session.selectOne("cocktailbarTotalPage");
	}
	catch (Exception ex) 
	{
	 ex.printStackTrace();
	}
	finally 
	{
		if(session!=null) session.close();
	}
	return total;
	}
	public static CocktailbarVO cocktailbarDetailData(int bar_no)
	  {
		  SqlSession session=ssf.openSession(true);
		  session.update("cocktailbarHitIncrement",bar_no);
		  session.commit();
		  CocktailbarVO vo=session.selectOne("cocktailbarDetailData",bar_no);
		  session.close();
		  return vo;
	  }
	public static CocktailbarVO cocktailbarCookieData(int bar_no)
	  {
		  SqlSession session=ssf.openSession();
		  CocktailbarVO vo=session.selectOne("cocktailbarDetailData",bar_no);
		  session.close();
		  return vo;
	  }
	
	/*
  <select id="cocktailbarFindData" resultType="CocktailbarVO" parameterType="hashmap">
    SELECT bar_no,name,address,phone,image,profile,hit,time,loc,subway,num
    FROM (SELECT bar_no,name,address,phone,image,profile,hit,time,loc,subway,rownum as num 
    FROM (SELECT INDEX_ASC(cocktailbar cb_bar_no_pk)bar_no,name,address,phone,image,profile,hit,time,loc,subway
    FROM cocktailbar WHERE ${?} LIKE '%'||#{?}||'%'))
    WHERE num BETWEEN #{start} AND #{end}
  </select>
  <select id="cocktailbarFindTotalPage" resultType="int" parameterType="hashmap">
    SELECT CEIL(COUNT(*)/12.0) 
    FROM cocktailbar
    WHERE ${?} LIKE '%'||#{?}||'%'
  </select>
	 */
//	 public static List<CocktailbarVO> cocktailbarFindData(Map map)
//	  {
//		  SqlSession session=ssf.openSession();
//		  List<CocktailbarVO> list=session.selectList("cocktailbarFindData",map);
//		  session.close();
//		  return list;
//	  }
	  // SQL
//	  public static int cocktailbarFindTotalPage(Map map)
//	  {
//		  SqlSession session=ssf.openSession();
//		  int total=session.selectOne("cocktailbarFindTotalPage",map);
//		  session.close();
//		  return total;
//	  }
	  public static void Cocktailbarinsert(CocktailbarVO vo)
	  {
		  SqlSession session=null;
	  try {
	        session = ssf.openSession(true);
	        session.insert("Cocktailbarinsert", vo);
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if (session != null) {
	            session.close();
	        }
	    }
	  }
	  public static void CocktailbarUpdate(CocktailbarVO vo)
	  {
		  SqlSession session=null;
		  try 
		  {
			  session=ssf.openSession(true);
			  session.update("CocktailbarUpdate",vo);
		  }
		  catch (Exception ex) 
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if (session != null) 
			  {
	            session.close();
	          }
		  }
		  
	  }
	  
	  public static void CocktailbarDelete(CocktailbarVO vo)
	  {
		  SqlSession session=null;
		  try 
		  {
			  session=ssf.openSession(true);
			  session.delete("CocktailbarDelete",vo);
		  }
		  catch (Exception ex) 
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if (session != null) 
			  {
	            session.close();
	          }
		  }
	  }
}