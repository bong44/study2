<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/inc/header.jsp"%>
<title>freeView.jsp</title>

<%
	IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
	FreeBoardVO free = freeBoardService.getBoard(Integer.parseInt(request.getParameter("boNo")));
	request.setAttribute("free", free);
%>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
	<div class="page-header">
		<h3>자유게시판 - <small>상세보기</small></h3>
	</div>
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<th>글번호</th>
					<td>17</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td>김광석의 일어나 가사입니다.</td>
				</tr>
				<tr>
					<th>글분류</th>
					<td>사는 이야기</td>
				</tr>
				<tr>
					<th>작성자명</th>
					<td>말자엄마</td>
				</tr>
				<!-- 비밀번호는 보여주지 않음  -->
				<tr>
					<th>내용</th>
					<td><pre>일어나 - 김광석 
검은 밤의 가운데 서 있어
한 치 앞도 보이질 않아
어디로 가야 하나 어디에 있을까
둘러 봐도 소용없었지

인생이란 강물 위를 끝없이
부초처럼 떠다니다가
어느 고요한 호숫가에 닿으면 물과 함께 썩어가겠지

일어나 일어나 다시 한번 해보는 거야
일어나 일어나 봄의 새싹들처럼
</pre>
					</td>
				</tr>
				<tr>
					<th>등록자 IP</th>
					<td>192.168.20.45</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>25</td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td>2020.08.12 15:25</td>
				</tr>
				<tr>
					<th>삭제여부</th>
					<td>N</td>
				</tr>
				<tr>
					<td colspan="2">
					  <div class="pull-left">
							<a href="freeList.jsp" class="btn btn-default btn-sm"> 
								<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
								&nbsp;&nbsp;목록
							</a>
						</div>
						<div class="pull-right">
							<a href="freeEdit.jsp?boNo=17" class="btn btn-success btn-sm"> 
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								&nbsp;&nbsp;수정
						  </a>
						</div>
					</td>					  
				</tr>
			</tbody>
		</table>
		
</div><!-- container -->
</body>
</html>






