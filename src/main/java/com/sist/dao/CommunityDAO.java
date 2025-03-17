package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.CommunityFreeboardVO;

import java.util.*;
public class CommunityDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<CommunityFreeboardVO> boardListData(Map map)
	{	
		// conn, ps
		SqlSession session=ssf.openSession();
		List<CommunityFreeboardVO> list=session.selectList("boardListData",map);
		session.close();
		return list;
	}
	public static int boardTotalPage()
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("boardTotalPage");
		session.close();
		return total;
	}
//	// 상세보기
	public static CommunityFreeboardVO boardDetailData(int no)
	{
		SqlSession session = ssf.openSession();
		// 조회수 증가
		session.update("boardHitIncrement",no);
		session.commit();
		// 데이터  가지고 오기
		CommunityFreeboardVO vo=session.selectOne("boardDetailData",no);
		// 반환
		session.close();
		return vo;
	}
	//이미지 db에 추가
	public static void boardInsertImage(Map map)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("boardInsertImage",map);
		session.close();
	}
	//이미지 db에서 삭제
	public static void boardDeleteImage(String[] imageNames)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("boardDeleteImage",imageNames);
		session.close();
	}
	//새 게시물 추가
	public static void boardInsertNewPost(CommunityFreeboardVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("boardInsertNewPost",vo);
		session.close();
	}
	public static void boardInsert(Map map)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("boardInsert",map);
		session.close();
	}
	//저장되지 않은 게시물 삭제
	public static void boardDeleteUnsaved(int board_no)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("boardDeleteUnsaved",board_no);
		session.close();
	}
	
}
