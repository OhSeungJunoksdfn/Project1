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
	public static int boardTotalPage(Map map)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("boardTotalPage",map);
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
		session.delete("boardDeleteImage",imageNames);
		session.close();
	}
	
	//저장되지 않은 변경사항인 이미지 삭제
	public static List<String> boardDeleteImageUnsaved(int no)
	{
		SqlSession session=ssf.openSession(true);
		List<String> unsavedImages = session.selectList("boardGetDeleteImage",no);
		session.delete("boardDeleteImageUnsaved");
		session.close();
		return unsavedImages;
	}
	//새 게시물 추가
	public static void boardInsertNewPost(CommunityFreeboardVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("boardInsertNewPost",vo);
		session.close();
	}
	//게시물 저장
	public static void boardSave(Map map)
	{
		SqlSession session=ssf.openSession(true);
		session.update("boardSave",map);
		session.close();
	}
	//저장되지 않은 게시물 삭제
	public static void boardDeleteUnsaved(int board_no)
	{
		SqlSession session=ssf.openSession();
		session.delete("boardDeleteUnsaved",board_no);
		session.commit();
		session.close();
	}
	//삭제될 게시물에 있는 이미지 가져오기
	public static List<String> boardGetDeleteImageAtDeleteBoard(int board_no)
	{
		SqlSession session=ssf.openSession();
		List<String> list = session.selectList("boardGetDeleteImageAtDeleteBoard",board_no);
		session.close();
		return list;
	}
	//게시물 삭제
	public static void boardDelete(int board_no)
	{
		SqlSession session=ssf.openSession();
		session.insert("boardDelete",board_no);
		session.commit();
		session.close();
	}

	
}
