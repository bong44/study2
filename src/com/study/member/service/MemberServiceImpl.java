package com.study.member.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.study.exception.BizDuplicateKeyException;
import com.study.exception.BizException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;
import com.study.exception.DaoException;
import com.study.member.dao.IMemberDao;
import com.study.member.dao.MemberDaoOracle;
import com.study.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	
	private IMemberDao memberDao = new MemberDaoOracle();

	@Override
	public void registMember(MemberVO member) throws BizDuplicateKeyException {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeMember(MemberVO member) throws BizNotEffectedException, BizNotFoundException {
		// TODO Auto-generated method stub

	}

	@Override
	public MemberVO getMember(String memId) throws BizNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> getMemberList() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			List<MemberVO> list = memberDao.getMemberList(conn);
			return list;
		} catch (SQLException e) {
			throw new DaoException("조회시", e);
		}finally {
			if(conn != null)try{conn.close();}catch(SQLException e){e.printStackTrace();}
		}
	}

}
