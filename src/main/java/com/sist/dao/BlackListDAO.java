package com.sist.dao;
import java.util.*;
import com.sist.vo.*;
import com.sist.commons.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BlackListDAO {
    private static SqlSessionFactory ssf;
    static {
        ssf = CreateSqlSessionFactory.getSsf();
    }

    // 1. 블랙리스트 전체 조회
    public static List<BlackListVO> getBlacklist() {
        SqlSession session = null;
        List<BlackListVO> list = new ArrayList<>();
        try {
            session = ssf.openSession();
            list = session.selectList("getBlacklist");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
        return list;
    }

    // 2. 블랙리스트 등록 + 로그인 상태 변경
    public static void insertBlacklist(BlackListVO vo) {
        SqlSession session = null;
        try {
            session = ssf.openSession(true);
            session.insert("blackListInsert", vo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }

    // 3. 블랙리스트 삭제
    public static void deleteBlacklist(int blackListNo) {
        SqlSession session = null;
        try {
            session = ssf.openSession(true);
            session.delete("deleteBlacklist", blackListNo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }
}
