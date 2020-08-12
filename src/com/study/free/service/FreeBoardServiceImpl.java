package com.study.free.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.BizPasswordNotMatchedException;
import com.study.exception.DaoException;
import com.study.free.dao.FreeBoardDaoOracle;
import com.study.free.dao.IFreeBoardDao;
import com.study.free.vo.FreeBoardVO;
import com.study.member.vo.MemberVO;

public class FreeBoardServiceImpl implements IFreeBoardService{

	private IFreeBoardDao boardDao = new FreeBoardDaoOracle(); 
	
	@Override
	public List<FreeBoardVO> getBoardList() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			List<FreeBoardVO> list = boardDao.getBoardList(conn);
			return list;
		} catch (SQLException e) {
			throw new DaoException("조회시", e);
		}finally {
			if(conn != null)try{conn.close();}catch(SQLException e){e.printStackTrace();}
		}
	} //getBoardList

	@Override
	public FreeBoardVO getBoard(int boNo) throws BizNotFoundException {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			FreeBoardVO vo = boardDao.getBoard(conn, boNo);
			if (vo == null) {
				throw new BizNotFoundException("["+boNo+"] 조회 실패");
			}
			return vo;
		} catch (SQLException e) {
			throw new DaoException("조회시", e);
		}finally {
			if(conn != null)try{conn.close();}catch(SQLException e){e.printStackTrace();}
		}
	}

	@Override
	public void registBoard(FreeBoardVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyBoard(FreeBoardVO board)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeBoard(FreeBoardVO board)
			throws BizNotFoundException, BizPasswordNotMatchedException, BizNotEffectedException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseHit(int boNo) {
		// TODO Auto-generated method stub
		
	}
	
}
