package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;

public class Cocktail_ProductDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	     <select id="cocktail_productListData" resultType="Cocktail_ProductVO" parameterType="hashmap">
		   SELECT product_no, name, type, price, poster, deliver, alc, volmn, loc, content, cno, hit, delivery_fee, num
		   FROM (SELECT product_no, name, type, price, poster, deliver, alc, volmn, loc, content, cno, hit, delivery_fee ,rownum as num 
		   FROM (SELECT + INDEX_ASC(cocktail_product c_prod_product_no_pk) product_no, name, type, price, poster, deliver, alc, volmn, loc, content, cno, hit, delivery_fee
		   FROM cocktail_product))
		   WHERE num BETWEEN #{start} AND #{end}
		</select>
		  <select id="cocktail_productTotalPage" resultType="int">
		   SELECT CEIL(COUNT(*)/12.0) FROM cocktail_product
		</select>
		<select id="cocktail_productDetailData" resultType="Cocktail_ProductVO" parameterType="int">
		    SELECT * FROM cocktail_product
		    WHERE product_no=#{product_no}
		</select>
		<update id="cocktail_productHitIncrement" parameterType="int">
		    UPDATE cocktail_product SET
		    hit=hit+1
		    WHERE product_no=#{product_no}
		</update>
	 */
	public static List<Cocktail_ProductVO> cocktail_productListData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<Cocktail_ProductVO> list=session.selectList("cocktail_productListData", map);
		session.close();
		for(Cocktail_ProductVO vo:list)
		{
			String priceStr=vo.getPrice();
			priceStr=priceStr.replaceAll("[^0-9]", "");
			if(!priceStr.isEmpty())
			{
				vo.setPriceInt(Integer.parseInt(priceStr));
			}
			else
			{
				vo.setPriceInt(0);
			}
		}
		return list;
	}
	public static int cocktail_productTotalPage(Map map)
	{
		
		SqlSession session=ssf.openSession();
		int total=session.selectOne("cocktail_productTotalPage", map);
		session.close();
		return total;
	}
	public static int cocktail_productTotalCount(Map map)
	{
		SqlSession session=ssf.openSession();
		int totalcount=session.selectOne("cocktail_productTotalCount", map);
		session.close();
		return totalcount;
	}
	public static Cocktail_ProductVO cocktail_productDetailData(int product_no)
	{
		SqlSession session=ssf.openSession();
		session.update("cocktail_productHitIncrement", product_no);
		session.commit();
		Cocktail_ProductVO vo=session.selectOne("cocktail_productDetailData", product_no);
		return vo;
	}
	public static Cocktail_ProductVO cocktail_productCookieData(int product_no)
	{
		SqlSession session=ssf.openSession();
		Cocktail_ProductVO vo=session.selectOne("cocktail_productDetailData", product_no);
		session.close();
		return vo;
	}
	public static List<Cocktail_ProductVO> cocktail_productFindData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<Cocktail_ProductVO> list=session.selectList("cocktail_productFindData", map);
		session.close();
		return list;
	}
	public static int cocktail_productFindTotalPage(Map map)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("cocktail_productFindTotalPage", map);
		session.close();
		return total;
	}
	public static List<Cocktail_ProductVO> cocktail_productFindRandomData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<Cocktail_ProductVO> list=session.selectList("cocktail_productFindRandomData", map);
		session.close();
		return list;
	}
	public static Cocktail_ProductVO cocktail_productCnoRandomData(Map map)
	{
		SqlSession session=ssf.openSession();
		Cocktail_ProductVO vo=session.selectOne("cocktail_productCnoRandomData", map);
		session.close();
		if(vo!=null)
		{
			String priceStr=vo.getPrice();
			priceStr=priceStr.replaceAll("[^0-9]", "");
			if(!priceStr.isEmpty())
			{
				vo.setPriceInt(Integer.parseInt(priceStr));
			}
			else
			{
				vo.setPriceInt(0);
			}
		}
		return vo;
	}
	public static List<Cocktail_ProductVO> cocktail_productCnoRandomData4(int cno)
	{
		SqlSession session=ssf.openSession();
		List<Cocktail_ProductVO> list=session.selectList("cocktail_productCnoRandomData4", cno);
		session.close();
		return list;
	}
	public static List<Cocktail_ProductVO> cocktail_productCnoRandomData12(Map map)
	{
		SqlSession session=ssf.openSession();
		List<Cocktail_ProductVO> list=session.selectList("cocktail_productCnoRandomData12", map);
		session.close();
		return list;
	}
	public static Map cocktail_productPriceData(Map map)
	{
		SqlSession session=ssf.openSession();
		Map priceRange=session.selectOne("cocktail_productPriceData", map);
		return priceRange;
	}
}