package com.sist.dao;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;

public class CocktailDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<CocktailVO> cocktailData12()
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailData12");
		}catch(Exception e) {
			e.printStackTrace();
		}finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
	public static List<CocktailVO> cocktailRecipeData(int cno)
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailRecipeData",cno);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
	public static List<CocktailVO> cocktailListData(Map map)
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailListData",map);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
	public static int cocktailTotalPage()
	{
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("cocktailTotalPage");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return total;
	}
	
	public static CocktailVO cocktailDetailData(int cno)
	{
		SqlSession session = null;
		CocktailVO vo = null;
		try {
			session = ssf.openSession();
			session.update("cocktailHitIncrement",cno);
			session.commit();
			vo = session.selectOne("cocktailDetailData",cno);
		}catch(Exception e) {
			e.printStackTrace();
		}finally
		{
			if(session!=null) session.close();
		}
		return vo;
	}
	public static List<CocktailVO> cocktailTagData(int cno)
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailTagData",cno);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
	
	public static List<CocktailVO> ingredientsHouseData12()
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("ingredientsHouseData12");
		}catch(Exception e) {
			e.printStackTrace();
		}finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
	
	public static List<CocktailVO> cocktailHouseData12()
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailHouseData12");
		}catch(Exception e) {
			e.printStackTrace();
		}finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
}
