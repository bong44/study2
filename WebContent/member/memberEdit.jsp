<%@page import="com.study.member.service.IMemberService"%>
<%@page import="com.study.exception.BizNotFoundException"%>
<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="com.study.member.service.MemberServiceImpl"%>
<%@page import="org.apache.catalina.tribes.membership.McastServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
	<title>memberEdit.jsp </title>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp" %>
 <div class="container">
	<h3>회원정보 수정</h3>		
   <%
 	IMemberService memberService = new MemberServiceImpl();
 	try{
	 	String memId = request.getParameter("memId");
	 	MemberVO mem = memberService.getMember(memId);
	 	request.setAttribute("mem", mem);
 	}catch(BizNotFoundException ex){
 		request.setAttribute("ex", ex);
 	}
 	
 %>
	<c:if test="${not empty ex}">
 		<div class="alert alert-warning"></div>
 		<p>해당 회원이 존재하지 않습니다</p>
 		<a href="memberList.jsp" class="btn btn-default btn-sm">
 		<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
 		&nbsp;목록
 		</a>
 	</c:if>
 	<c:if test="${empty ex}">
	<form action="memberModify.jsp" method="post" >
		<input value='${mem.memId}' name="memId" type="hidden">
	<table class="table table-striped">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${mem.memId}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memPass" class="form-control input-sm" 
				pattern="\w{4,}" title="알파벳과 숫자 4글자 이상 입력"></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="memName" class="form-control input-sm" value='${mem.memName}' 
				required="required" pattern="[가-힣]{2,}" title="한글로 두 글자 이상 입력"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="memZip" class="form-control input-sm" value='${mem.memZip}' ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				<input type="text" name="memAdd1" class="form-control input-sm" value='${mem.memAdd1}' >
				<input type="text" name="memAdd2" class="form-control input-sm" value='${mem.memAdd2}' >
				</td>
			</tr>
			<tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="memBir" class="form-control input-sm" value='${mem.memBir}'></td>
			</tr>
			<tr>
				<th>메일</th>
				<td><input type="email" name="memMail" class="form-control input-sm" required="required" value='${mem.memMail}'></td>
			</tr>
			<tr>
				<th>헨드폰</th>
				<td><input type="tel" name="memHp" class="form-control input-sm" value="${mem.memHp}"></td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
					<select name="memJob" >
						<option value="">-- 직업 선택 --</option>
						<option value="JB01" ${"JB01" eq mem.memJob ? "selected='selected'":"" }>주부</option>
						<option value="JB02" ${"JB02" eq mem.memJob ? "selected='selected'":"" }>은행원</option>
						<option value="JB03" ${"JB03" eq mem.memJob ? "selected='selected'":"" }>공무원</option>
						<option value="JB04" ${"JB04" eq mem.memJob ? "selected='selected'":"" }>축산업</option>
						<option value="JB05" ${"JB05" eq mem.memJob ? "selected='selected'":"" }>회사원</option>
						<option value="JB06" ${"JB06" eq mem.memJob ? "selected='selected'":"" }>농업</option>
						<option value="JB07" ${"JB07" eq mem.memJob ? "selected='selected'":"" }>자영업</option>
						<option value="JB08" ${"JB08" eq mem.memJob ? "selected='selected'":"" }>학생</option>
						<option value="JB09" ${"JB09" eq mem.memJob ? "selected='selected'":"" }>교사</option>					
					</select>				
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<select name="memLike" >
						<option value="">-- 취미 선택 --</option>
						<option value="HB01" ${"HB01" eq mem.memLike ?"selected='selected'":""}>서예</option>
						<option value="HB02" ${"HB02" eq mem.memLike ?"selected='selected'":""}>장기</option>
						<option value="HB03" ${"HB03" eq mem.memLike ?"selected='selected'":""}>수영</option>
						<option value="HB04" ${"HB04" eq mem.memLike ?"selected='selected'":""}>독서</option>
						<option value="HB05" ${"HB05" eq mem.memLike ?"selected='selected'":""}>당구</option>
						<option value="HB06" ${"HB06" eq mem.memLike ?"selected='selected'":""}>바둑</option>
						<option value="HB07" ${"HB07" eq mem.memLike ?"selected='selected'":""}>볼링</option>
						<option value="HB08" ${"HB08" eq mem.memLike ?"selected='selected'":""}>스키</option>
						<option value="HB09" ${"HB09" eq mem.memLike ?"selected='selected'":""}>만화</option>
						<option value="HB10" ${"HB010" eq mem.memLike ?"selected='selected'":""}>낚시</option>
						<option value="HB11" ${"HB011" eq mem.memLike ?"selected='selected'":""}>영화감상</option>
						<option value="HB12" ${"HB012" eq mem.memLike ?"selected='selected'":""}>등산</option>
						<option value="HB13" ${"HB013" eq mem.memLike ?"selected='selected'":""}>개그</option>
						<option value="HB14" ${"HB014" eq mem.memLike ?"selected='selected'":""}>카레이싱</option>					
					</select>				
				</td>
			</tr>
			<tr>
				<td>마일리지</td>
				<td>${mem.memMileage}</td>
			</tr>			
			<tr>
				<td>탈퇴여부</td>
				<td>
					<input type="radio" name="memDelete" value="Y" ${"Y" eq mem.memDelete ?"checked='checked'":""  }>Y
					<input type="radio" name="memDelete" value="N" ${!"N" eq mem.memDelete ?"checked='checked'":"" }>N
					
				</td>
			</tr>			
			<tr>
				<td colspan="2">
					<a href="memberList.jsp" class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					&nbsp; 목록
					</a>
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-heart-save" aria-hidden="true" ></span>
						저장
					</button>
				</td>
			</tr>
		</tbody>	
	</table>
	</form>
	</c:if>
</div>

</body>
</html>