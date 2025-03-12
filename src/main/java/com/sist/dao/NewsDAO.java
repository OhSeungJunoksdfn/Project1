package com.sist.dao;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;

public class NewsDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<NewsVO> newsHouseData3(){
		SqlSession session= null;
		List<NewsVO> list = null;
		try {
			session=ssf.openSession();
			list=session.selectList("newsHouseData3");
		} catch (Exception e) {
				e.printStackTrace();
		}finally
		{
			if(session!=null) session.close();
		}
		return list;
	}
}
