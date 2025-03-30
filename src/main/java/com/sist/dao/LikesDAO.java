package com.sist.dao;
import com.sist.commons.*;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
public class LikesDAO {
	private static SqlSessionFactory ssf=null;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static void likesInsert(LikesVO vo)
	{
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("likesInsert",vo);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
	}
	public static void likesDelete(int likes_no)
	{
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("likesDelete",likes_no);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
	}
	public static int likesData(LikesVO vo)
	{
		SqlSession session = null;
		int count = 0;
		try {
			session = ssf.openSession(true);
			count =session.selectOne("likesData",vo);
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
