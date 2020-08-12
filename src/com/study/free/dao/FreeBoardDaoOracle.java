package com.study.free.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.exception.DaoException;
import com.study.free.vo.FreeBoardVO;

public class FreeBoardDaoOracle implements IFreeBoardDao{

	@Override
	public List<FreeBoardVO> getBoardList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		List<FreeBoardVO> list = new ArrayList<FreeBoardVO>();
		
		try {
			sb.append(" SELECT											  ");
		    sb.append("     bo_no					     				  ");
		    sb.append("     , bo_title								      ");
		    sb.append("     , bo_category								      ");
		    sb.append("     , b.comm_nm AS bo_category_nm				");
		    sb.append("     , bo_writer									  ");
		    sb.append("     , bo_pass									  ");
		    sb.append("     , bo_ip						 				 ");
		    sb.append("     , bo_hit									  ");
		    sb.append("     , bo_reg_date	  					         ");
			sb.append("     , bo_mod_date  						         ");
			sb.append("     , bo_del_yn					      			   ");
			sb.append(" FROM free_board , comm_code b		        	  ");
			sb.append(" where bo_category = b.comm_cd 			     ");
			System.out.println(sb.toString().replaceAll("\\s{2,}", "")); // \s = 공백이 2, = 2개이상인
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			FreeBoardVO free = null;
			while(rs.next()) {
				free = new FreeBoardVO(); //하나하나 값에 모두 다른 주소값을 줌
				free.setBoNo(rs.getInt("bo_no"));
				free.setBoTitle(rs.getString("bo_title"));
				free.setBoCategory(rs.getString("bo_category"));
				free.setBoCategoryNm(rs.getString("bo_category_nm"));
				free.setBoWriter(rs.getString("bo_category_nm"));
				free.setBoPass(rs.getString("bo_pass"));
				free.setBoIp(rs.getString("bo_ip"));
				free.setBoHit(rs.getInt("bo_hit"));
				free.setBoRegDate(rs.getString("bo_reg_date"));
				free.setBoModDate(rs.getString("bo_mod_date"));
				free.setBoDelYn(rs.getString("bo_del_yn"));
				list.add(free);
			} //while
			
			return list;
		} catch (SQLException e) {
			throw new DaoException(e.getMessage(), e);
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
		}
	}

	@Override
	public FreeBoardVO getBoard(Connection conn, int boNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append(" SELECT											  ");
		    sb.append("     bo_no					     				  ");
		    sb.append("     , bo_title								      ");
		    sb.append("     , bo_category								      ");
		    sb.append("     , b.comm_nm AS bo_category_nm				");
		    sb.append("     , bo_writer									  ");
		    sb.append("     , bo_pass									  ");
		    sb.append("     , bo_ip						 				 ");
		    sb.append("     , bo_hit									  ");
		    sb.append("     , bo_reg_date	  					         ");
			sb.append("     , bo_mod_date  						         ");
			sb.append("     , bo_del_yn					      			   ");
			sb.append("     , bo_content				      			   ");
			sb.append(" FROM free_board , comm_code b		        	  ");
			sb.append(" where bo_category = b.comm_cd 			     ");
			sb.append(" and bo_no = ? 			                      ");
			System.out.println(sb.toString().replaceAll("\\s{2,}", "")); // \s = 공백이 2, = 2개이상인
			pstmt = conn.prepareStatement(sb.toString());
			//bind 변수 설정(파라미터 변수)
			pstmt.setInt(1, boNo);
			rs = pstmt.executeQuery();
			FreeBoardVO free = null;
			while(rs.next()) {
				free = new FreeBoardVO(); //하나하나 값에 모두 다른 주소값을 줌
				free.setBoNo(rs.getInt("bo_no"));
				free.setBoTitle(rs.getString("bo_title"));
				free.setBoCategory(rs.getString("bo_category"));
				free.setBoCategoryNm(rs.getString("bo_category_nm"));
				free.setBoWriter(rs.getString("bo_category_nm"));
				free.setBoPass(rs.getString("bo_pass"));
				free.setBoIp(rs.getString("bo_ip"));
				free.setBoHit(rs.getInt("bo_hit"));
				free.setBoRegDate(rs.getString("bo_reg_date"));
				free.setBoModDate(rs.getString("bo_mod_date"));
				free.setBoDelYn(rs.getString("bo_del_yn"));
				free.setBoContent(rs.getString("bo_content"));
			} //while
			
			return free;
		} catch (SQLException e) {
			throw new DaoException(e.getMessage(), e);
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
		}
	}

	@Override
	public int insertBoard(Connection conn, FreeBoardVO board) {
	//	PreparedStatement pstmt = null;
	//	ResultSet rs = null;
	//	StringBuffer sb = new StringBuffer();
	//	List<MemberVO> list = new ArrayList<MemberVO>();
	//	
	//	try {
	//		sb.append(" INSERT INTO     				    ");
	//	    sb.append(" free_board ( 					    ");
	//	    sb.append("     bo_no 							");
	//	    sb.append("     , bo_title 					    ");
	//	    sb.append("     , bo_category 					 ");
	//	    sb.append("     , bo_writer 					 ");
	//	    sb.append("     , bo_pass 					    ");
	//	    sb.append("     , bo_content 				    ");
	//	    sb.append("     , bo_ip 					    ");
	//	    sb.append("     , bo_hit 		  			    ");
	//		sb.append("     , bo_reg_date        		    ");
	//		sb.append("     , bo_mod_date      	     	 ");
	//		sb.append("     , bo_del_yn     				  ");
	//		sb.append(" ) VALUES (     						  ");
	//		sb.append("     seq_free_board.nextval     	  ");
	//		sb.append("     , ?         				  	  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append("     , sysdate     					  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append("     , ?     						  	  ");
	//		sb.append(" )     						     	  ");
	//		System.out.println(sb.toString().replaceAll("\\s{2,}", "")); // \s = 공백이 2, = 2개이상인
	//		pstmt = conn.prepareStatement(sb.toString());
	//		rs = pstmt.executeQuery();
	//		MemberVO member = null;
	//		while(rs.next()) {
	//			member = new MemberVO(); //하나하나 값에 모두 다른 주소값을 줌
	//			member.setMemId(rs.getString("mem_id"));
	//			member.setMemName(rs.getString("mem_name"));
	//			member.setMemPass(rs.getString("mem_pass"));
	//			member.setMemBir(rs.getString("mem_bir"));
	//			member.setMemZip(rs.getString("mem_zip"));
	//			member.setMemAdd1(rs.getString("mem_add1"));
	//			member.setMemAdd2(rs.getString("mem_add2"));
	//			member.setMemHp(rs.getString("mem_hp"));
	//			member.setMemJob(rs.getString("mem_job"));
	//			member.setMemJobNm(rs.getString("mem_job_nm"));
	//			member.setMemLike(rs.getString("mem_like"));
	//			member.setMemLikeNm(rs.getString("mem_like_nm"));
	//			member.setMemMileage(rs.getInt("mem_mileage"));
	//			member.setMemDelete(rs.getString("mem_delete"));
	//			list.add(member);
	//		} //while
	//		
	//		return list;
	//	} catch (SQLException e) {
	//		throw new DaoException(e.getMessage(), e);
	//	}finally {
	//		if(rs != null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
	//		if(pstmt != null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
	//	}
		return 0;
	}

	@Override
	public int updateBoard(Connection conn, FreeBoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(Connection conn, FreeBoardVO board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseHit(Connection conn, int boNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
