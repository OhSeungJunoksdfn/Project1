package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.*;

public class ProductDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<ProductVO> productHouseData12()
	{
		SqlSession session = ssf.openSession();
		List<ProductVO> list= session.selectList("productHouseData12");
		session.close();
		return list;
	}
}
