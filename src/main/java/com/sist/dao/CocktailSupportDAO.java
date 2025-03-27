package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class CocktailSupportDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<CocktailbarVO> cocktailbarFind(Map map)
	{
		SqlSession session = null;
		List<CocktailbarVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailbarFind",map);
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
	public static int cocktailbarFindTotal(Map map)
	{
		SqlSession session = null;
		int count = 0;
		try {
			session = ssf.openSession();
			count = session.selectOne("cocktailbarFindTotal",map);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return count;
	}
	//칵테일바 예약
	public static List<CocktailbarVO> cocktailbarRserveList(String loc)
	{
		SqlSession session = null;
		List<CocktailbarVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailbarRserveList",loc);
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
	public static String reserveDayTimeInfoData(int rno)
	{
		SqlSession session = null;
		String time = null;
		try {
			session = ssf.openSession();
			time = session.selectOne("reserveDayTimeInfoData",rno);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return time;
	}
	public static String reserveGetTimeData(int tno)
	{
		SqlSession session = null;
		String time = null;
		try {
			session = ssf.openSession();
			time = session.selectOne("reserveGetTimeData",tno);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
		return time;
	}
	public static void reserveInsert(ReserveVO vo)
	{
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("reserveInsert",vo);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
	}
}
