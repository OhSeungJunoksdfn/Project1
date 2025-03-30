package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.CommunityCommentVO;
import com.sist.vo.CommunityFreeboardVO;

public class CommunityManageDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<CommunityFreeboardVO> boardListData(Map map)
	{	
		
		SqlSession session=ssf.openSession();
		List<CommunityFreeboardVO> list=session.selectList("postListData",map);
		session.close();
		return list;
	}
	
	public static int boardTotalPage(String id)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("postTotalPage",id);
		session.close();
		return total;
	}
	
	public static void postDelete(String deleteList)
	{
		SqlSession session=ssf.openSession(true);
		session.delete("postDelete",deleteList);
		session.close();
	}
	
	public static List<CommunityCommentVO> commentListData(Map map)
	{	
		
		SqlSession session=ssf.openSession();
		List<CommunityCommentVO> list=session.selectList("commentListData",map);
		session.close();
		return list;
	}
	
	public static int commentTotalPage(String id)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("commentTotalPage",id);
		session.close();
		return total;
	}
	
	public static void commentDelete(String deleteList)
	{
		SqlSession session=ssf.openSession(true);
		String[] deleteListArray = deleteList.split(",");
		session.delete("commentDelete",deleteListArray);
		session.close();
	}
}
