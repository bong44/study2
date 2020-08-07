package com.study.member.dao;

import java.sql.Connection;
import java.util.List;

import com.study.member.vo.MemberVO;

public interface IMemberDao {

	public int insertMember(Connection conn, MemberVO member);
	public int updateMember(Connection conn, MemberVO member);
	public int deleteMember(Connection conn, MemberVO member);
	public MemberVO getMember(Connection conn, String memId);
	public List<MemberVO> getMemberList(Connection conn);
}
