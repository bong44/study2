<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>자유게시판</title>
<%
	IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
	List<FreeBoardVO> free = freeBoardService.getBoardList();
	request.setAttribute("free", free);
%>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
	<div class="page-header">
		<h3>자유게시판</h3>
	</div>
<div class="row">
    <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;" >
        <a href="freeForm.jsp" class="btn btn-primary btn-sm"> 
        	<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
        	&nbsp;새글쓰기
		</a>
    </div>
</div>
	<table class="table table-striped table-bordered table-hover">
	<colgroup>
		<col width="10%" />
		<col width="15%" />
		<col />
		<col width="10%" />
		<col width="15%" />
		<col width="10%" />
	</colgroup>
	<thead>
		<tr>
			<th>글번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	</thead>	
	<tbody>
	<c:forEach items="${free}" var="f">
		<tr class="text-center">
			<td>${f.boNo}</td>
			<td>${f.boCategoryNm}</td>
			<td class="text-left">
				<a href="freeView.jsp?boNo=${f.boNo}">
					${f.boTitle}
				</a>
			</td>
			<td>${f.boWriter}</td>
			<td>${f.boRegDate}</td>
			<td>${f.boHit}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
</body>
</html>




