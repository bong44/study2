<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	<title>memberList.jsp </title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
	<h3>회원목록</h3>
	<jsp:useBean id="member" class="com.study.member.vo.MemberVO"></jsp:useBean>
	<jsp:setProperty property="*" name="member"/>		
<%
	//1.드라이버 로딩
	//변수 선언
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	int i = 1;
	
	//2.커넥션 구하기
	conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","java","oracle");
	
	//3.구문 객체 생성
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("   INSERT INTO member (                             ");
	sb.append("	    mem_id                                       ");
	sb.append("	    , mem_pass    , mem_name    , mem_bir        ");
	sb.append("	    , mem_zip    , mem_add1    , mem_add2        ");
	sb.append("	    , mem_hp    , mem_mail    , mem_job          ");
	sb.append("	    , mem_like    , mem_mileage    , mem_delete  ");
	sb.append("	) VALUES (                                       ");
	sb.append("	    	?   , ?    , ?                      ");
	sb.append("	    ,  ?   , ?    , ?                      ");
	sb.append("	    ,  ?   , ?    , ?                      ");
	sb.append("	    ,  ?   , ?    , 0                      ");
	sb.append("	    , ''                                  ");
	sb.append("	)                                          ");
	
	stmt = conn.prepareStatement(sb.toString()); 
	
	stmt.setString(i++, member.getMemId());
	stmt.setString(i++, member.getMemPass());
	stmt.setString(i++, member.getMemName());
	stmt.setString(i++, member.getMemBir());
	stmt.setString(i++, member.getMemZip());
	stmt.setString(i++, member.getMemAdd1());
	stmt.setString(i++, member.getMemAdd2());
	stmt.setString(i++, member.getMemHp());
	stmt.setString(i++, member.getMemMail());
	stmt.setString(i++, member.getMemJob());
	stmt.setString(i++, member.getMemLike());
	
	
	int cnt = stmt.executeUpdate();
	if(cnt > 0){
		%>
			<div class="alert alert-success">
				정상적으로 회원이 등록되었습니다!!
			</div>
		<%
	}
	if(conn!=null){try{conn.close();}catch(SQLException e){e.printStackTrace();}}
	if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
	if(stmt!=null){try{stmt.close();}catch(SQLException e){e.printStackTrace();}}
%>
</body>
</html>