package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.CartVO;

public class CartDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void cartInsert(CartVO vo)
	{
		SqlSession session=ssf.openSession(true);
		int count=session.selectOne("cartCount", vo);
		if(count==0)
		{
			session.insert("cartInsert", vo);
		}
		else
		{
			session.update("cartUpdate", vo);
		}
	}
	
	public static List<CartVO> cartListData(String id)
	{
		SqlSession session=ssf.openSession();
		
		List<CartVO> list=session.selectList("cartListData", id);
		session.close();
		return list;
	}
	
	public static void cartDelete(int cno)
	{
		SqlSession session=ssf.openSession(true);
		try
		{
			session.delete("cartDelete", cno);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		session.close();
	}
	
	 public static void buy(CartVO vo)
	 {
		 SqlSession session=ssf.openSession();
		 try {
			 session.insert("buy", vo);
		 }catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
		 session.close();
	 }
	 
	 
}