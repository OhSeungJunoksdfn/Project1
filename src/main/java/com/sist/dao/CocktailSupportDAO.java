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
}
