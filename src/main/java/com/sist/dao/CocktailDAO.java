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
	public static List<CocktailVO> cocktailData4()
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailData4");
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
	public static int cocktailTotalPage(String detail)
	{
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("cocktailTotalPage",detail);
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
	public static List<CocktailVO> ingredientsListData(Map map)
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("ingredientsListData",map);
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
	public static int ingredientsTotalPage()
	{
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("ingredientsTotalPage");
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
	
	public static List<CocktailVO> cocktailFindData(Map map)
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cocktailFindData",map);
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
	public static int cocktailFindCount(String ss)
	{
		SqlSession session = null;
		int count = 0;
		try {
			session = ssf.openSession();
			count = session.selectOne("cocktailFindCount",ss);
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
	
	public static CocktailVO ingredientsDetailData(int no)
	{
		SqlSession session = null;
		CocktailVO vo = null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("ingredientsDetailData",no);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			if(session!=null) session.close();
		}
		return vo;
	}
	public static List<CocktailVO> ingredientsMakeList(int no)
	{
		SqlSession session = null;
		List<CocktailVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("ingredientsMakeList",no);
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
	public static List<CocktailIngredientsVO> ingredientsFindData(String fd)
	{
		SqlSession session = null;
		List<CocktailIngredientsVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("ingredientsFindData",fd);
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
	public static void cocktailInsert(CocktailVO vo,String[] ing_no,String[] unit,String[] volume )
	{
		SqlSession session = null;
		int cocktail_no=0;
		try {
			session = ssf.openSession();
			cocktail_no = session.selectOne("select_no");
			vo.setCocktail_no(cocktail_no);
			session.insert("cocktailInsert",vo);
			session.commit();
			
			CocktailVO ivo = new CocktailVO();
			ivo.setCocktail_no(cocktail_no);
			if(Integer.parseInt(vo.getAlc())==0)
			{
				ivo.getCtvo().setValue("무알콜");
			}
			else if(Integer.parseInt(vo.getAlc())>=20)
			{
				ivo.getCtvo().setValue("강한 도수");
			}
			else 
			{
				ivo.getCtvo().setValue("약한 도수");
			}
			session.insert("cocktailTagInsert",ivo);
			Map<String, String> map = new HashMap<>();
			map.put("럼", "럼베이스");
			map.put("보드카", "보드카베이스");
			map.put("위스키", "위스키베이스");
			map.put("진", "진베이스");
			map.put("데킬라", "데킬라베이스");
			map.put("브랜디", "브랜디베이스");
			map.put("소주", "소주베이스");
			for(int i=0; i<ing_no.length;i++) {
				for(String val:map.keySet())
				{
					if(ing_no[i].contains(val))
					{
						ivo.getCtvo().setValue(map.get(val));
						session.insert("cocktailTagInsert",ivo);
						break;
					}
				}
			}
			ivo.getCtvo().setValue("재료 " + ing_no.length+"개" );
			session.insert("cocktailTagInsert",ivo);
			
			for(int i=0;i<ing_no.length;i++)
			{
				ivo.getCrivo().setIng_no(Integer.parseInt(ing_no[i].trim()));
				ivo.getCrivo().setUnit(unit[i]);
				ivo.getCrivo().setVolume(Integer.parseInt(volume[i].trim()));
				session.insert("cocktailRecipeInsert",ivo);
			}
			
			session.commit();
		}catch(Exception e)
		{
			e.printStackTrace();
			session = ssf.openSession();
			session.delete("cocktailDelete",cocktail_no);
			//여기다가 insert한거 삭제하기 cocktail먼저 만들고 나머지 만들기 실패하면 여기서 삭제 cocktail_no는 처음에 불러와서 그거로 하는거로??
		}
		finally
		{
			if(session!=null) session.close();
		}
	}
	
	public static void cocktailUpdate(CocktailVO vo)
	{
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("cocktailUpdate",vo);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
	}
	public static void cocktailTagUpdate(CocktailTagVO vo)
	{
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("cocktailTagUpdate",vo);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
	}
	public static void cocktailRecipeUpdate(CocktailRecipeIngredientsVO vo)
	{
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("cocktailRecipeUpdate",vo);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null) session.close();
		}
	}
	public static void cocktailDelete(int cocktail_no)
	{
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.delete("cocktailRecipeDelete",cocktail_no);
			session.delete("cocktailTagDelete",cocktail_no);
			session.delete("cocktailDelete",cocktail_no);
			session.commit();
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
