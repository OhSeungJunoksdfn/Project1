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
		List<CommunityCommentVO> list=session.selectList("",board_no);
		session.close();
		return list;
		
	}
}
