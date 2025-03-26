package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import java.util.*;
import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.CommunityCommentVO;
import com.sist.vo.CommunityFreeboardVO;

public class CommunityCommentDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<CommunityCommentVO> getCommentData(int board_no){
		
		SqlSession session=ssf.openSession();
		List<CommunityCommentVO> list=session.selectList("getCommentData",board_no);
		session.close();
		return list;
		
	}
	
	public static void insertComment(Map map)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("insertComment",map);
		session.close();
	}
	
	public static void insertCommentReply(Map map)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("insertCommentReply",map);
		session.close();
	}
	
	public static void deleteComment(int comment_no)
	{
		SqlSession session=ssf.openSession(true);
		session.update("deleteComment",comment_no);
		session.close();
	}
}
