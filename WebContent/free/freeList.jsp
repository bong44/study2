<%@page import="com.study.code.vo.CodeVO"%>
<%@page import="com.study.code.service.CommonCodeServiceImpl"%>
<%@page import="com.study.code.service.ICommonCodeService"%>
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
</head>
<body>
<jsp:useBean id="searchVO" class="com.study.free.vo.FreeBoardSearchVO"></jsp:useBean>
<jsp:setProperty property="*" name="searchVO"/>
<%
	IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
	List<FreeBoardVO> free = freeBoardService.getBoardList(searchVO);
	request.setAttribute("free", free);
	
	ICommonCodeService codeService = new CommonCodeServiceImpl();
 	List<CodeVO> cateList = codeService.getCodeListByParent("BC00");
 	request.setAttribute("cateList", cateList);
%>
<%@include file="/WEB-INF/inc/top.jsp" %>
<div class="container">
	<div class="page-header">
		<h3>자유게시판</h3>
	</div>
	<!-- START : 검색 폼  --> 
<div class="row panel panel-default">
  <div class="panel-body">
    <form name="frm_search" action="freeList.jsp" method="post" class="form-horizontal">
        <input type="hidden" name="curPage" value="1">
        <input type="hidden" name="rowSizePerPage" value="10">
          <div class="form-group">
            <label for="id_searchType" class="col-sm-2 control-label">검색</label>
            <div class="col-sm-2">
                <select id="id_searchType" name="searchType" class="form-control input-sm">			    		
                    <option value="T" >제목</option>
                    <option value="W" >작성자</option>
                    <option value="C" >내용</option>
                </select>
            </div>
            <div class="col-sm-2">	
              <input type="text" name="searchWord" class="form-control input-sm" value="" placeholder="검색어" >			      
            </div>
            <label for="id_searchCategory" class="col-sm-2 col-sm-offset-2 control-label">분류</label>
            <div class="col-sm-2">
                <select id="id_searchCategory" name="searchCategory" class="form-control input-sm">
                    <option value="">-- 전체 --</option>
                    <c:forEach items="${cateList}" var="code">
                        <option value="${code.commCd}" >${code.commNm}</option>
                    </c:forEach>
                </select>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-2 col-sm-offset-9 text-right" >
              <button type="button" id="id_btn_reset" class="btn btn-sm btn-default">
                    <i class="fa fa-sync"></i>
                    &nbsp;&nbsp;초기화 
                </button>
            </div>     
            <div class="col-sm-1 text-right" >
                <button type="submit" class="btn btn-sm btn-primary ">
                    <i class="fa fa-search"></i>
                    &nbsp;&nbsp;검 색
                </button>
            </div>
          </div>
    </form>
  </div>
</div>
<!-- END : 검색 폼  --> 
<!-- START : 목록건수 및 새글쓰기 버튼  --> 
<div class="row" style="margin-bottom: 10px;">
    <div class="col-sm-3 form-inline"  >
        전체 ${searchVO.totalRowCount} 건 조회
        <select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm" >
            <option value="10" >10</option>
            <option value="20" >20</option>
            <option value="30" >30</option>
            <option value="50" >50</option>
        </select>
    </div>
    <div class="col-sm-2 col-sm-offset-7 text-right" >
        <a href="freeForm.jsp" class="btn btn-primary btn-sm"> 
            <span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
            &nbsp;새글쓰기
		</a>
    </div>
</div>
<!-- END : 목록건수 및 새글쓰기 버튼  --> 
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
	<!-- START : 페이지네이션  --> 
<nav class="text-center">
    <ul class="pagination">
        <!-- 이전 페이지 -->
        <c:if test="${searchVO.firstPage > 1}">
	        <li><a href="freeList.jsp?curPage=${searchVO.firstPage-1 }" data-page="${searchVO.firstPage-1 }" ><span aria-hidden="true">&laquo;</span></a></li>
        </c:if>

        <!-- 페이지 넘버링  -->
        <c:forEach var="i" begin="${searchVO.firstPage }" end="${searchVO.lastPage }">
        	 <c:if test="${searchVO.curPage == i }">
		        <li class="active"><a href="#"  >${i }</a></li>
        	 </c:if>
        	 <c:if test="${searchVO.curPage != i }">
		        <li><a href="freeList.jsp?curPage=${i }"  data-page="${i }" >${i }</a></li>
        	 </c:if>
        </c:forEach>
        <!-- 다음  페이지  -->
        <c:if test="${searchVO.lastPage < searchVO.totalPageCount}">
	        <li><a href="freeList.jsp?curPage=${searchVO.lastPage+1 }" data-page="${searchVO.lastPage+1 }" ><span aria-hidden="true">&raquo;</span></a></li>
        </c:if>
    </ul>	
</nav>
<!-- END : 페이지네이션  --> 
	</div>
</body>
</html>




