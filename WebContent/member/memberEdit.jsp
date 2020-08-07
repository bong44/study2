<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.jdbc.OracleDriver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <%
  	String memId = request.getParameter("memId");
  	
	//1.드라이버 로딩
	OracleDriver driver = new OracleDriver();

	//1_2.연결하기
	Connection connection = null;
	//sql 인젝션을 막기위한 방법
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//2. 커넥션 구하기
	connection = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
	
		
	StringBuffer sb = new StringBuffer();
	sb.append("SELECT mem_id    , mem_pass    , mem_name      ");
    sb.append(", TO_CHAR(mem_bir,'YYYY-MM-DD') AS mem_bir     ");
    sb.append("  			   , mem_zip    , mem_add1           ");
    sb.append(", mem_add2    , mem_hp    , mem_mail           ");
    sb.append(", mem_job    , mem_like    , mem_mileage       ");
    sb.append(", mem_delete                                   ");
	sb.append(" FROM member                                   ");
	sb.append(" WHERE mem_id = ?     ");
	
	pstmt = connection.prepareStatement(sb.toString()); 
	pstmt.setString(1, memId);
	//구문실행 전에 파라미터 생성
	rs = pstmt.executeQuery();
	
	while(rs.next()){
 %>	
	<h3>회원정보 수정</h3>		
	<form action="memberModify.jsp" method="post" >
		<input value='<%=rs.getString("mem_id") %>' name="memId" type="hidden">
	<table class="table table-striped">
		<tbody>
			<tr>
				<th>아이디</th>
				<td><%=rs.getString("mem_id") %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memPass" class="form-control input-sm" 
				pattern="\w{4,}" title="알파벳과 숫자 4글자 이상 입력"></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="memName" class="form-control input-sm" value='<%=rs.getString("mem_name") %>' 
				required="required" pattern="[가-힣]{2,}" title="한글로 두 글자 이상 입력"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="memZip" class="form-control input-sm" value='<%=rs.getString("mem_zip") %>' ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				<input type="text" name="memAdd1" class="form-control input-sm" value='<%=rs.getString("mem_add1") %>' >
				<input type="text" name="memAdd2" class="form-control input-sm" value='<%=rs.getString("mem_add2") %>' >
				</td>
			</tr>
			<tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="memBir" class="form-control input-sm" value='<%=rs.getString("mem_bir") %>'></td>
			</tr>
			<tr>
				<th>메일</th>
				<td><input type="email" name="memMail" class="form-control input-sm" required="required" value='<%=rs.getString("mem_mail") %>'></td>
			</tr>
			<tr>
				<th>헨드폰</th>
				<td><input type="tel" name="memHp" class="form-control input-sm" value="<%=rs.getString("mem_hp") %>"></td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
				<%
					String job = rs.getString("mem_job");
					String hob = rs.getString("mem_like");
				%>
					<select name="memJob" >
						<option value="">-- 직업 선택 --</option>
						<option value="JB01" <%="JB01".equals(job)?"selected='selected'":"" %>>주부</option>
						<option value="JB02" <%="JB02".equals(job)?"selected='selected'":"" %>>은행원</option>
						<option value="JB03" <%="JB03".equals(job)?"selected='selected'":"" %>>공무원</option>
						<option value="JB04" <%="JB04".equals(job)?"selected='selected'":"" %>>축산업</option>
						<option value="JB05" <%="JB05".equals(job)?"selected='selected'":"" %>>회사원</option>
						<option value="JB06" <%="JB06".equals(job)?"selected='selected'":"" %>>농업</option>
						<option value="JB07" <%="JB07".equals(job)?"selected='selected'":"" %>>자영업</option>
						<option value="JB08" <%="JB08".equals(job)?"selected='selected'":"" %>>학생</option>
						<option value="JB09" <%="JB09".equals(job)?"selected='selected'":"" %>>교사</option>					
					</select>				
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<select name="memLike" >
						<option value="">-- 취미 선택 --</option>
						<option value="HB01" <%="HB01".equals(hob)?"selected='selected'":"" %>>서예</option>
						<option value="HB02" <%="HB02".equals(hob)?"selected='selected'":"" %>>장기</option>
						<option value="HB03" <%="HB03".equals(hob)?"selected='selected'":"" %>>수영</option>
						<option value="HB04" <%="HB04".equals(hob)?"selected='selected'":"" %>>독서</option>
						<option value="HB05" <%="HB05".equals(hob)?"selected='selected'":"" %>>당구</option>
						<option value="HB06" <%="HB06".equals(hob)?"selected='selected'":"" %>>바둑</option>
						<option value="HB07" <%="HB07".equals(hob)?"selected='selected'":"" %>>볼링</option>
						<option value="HB08" <%="HB08".equals(hob)?"selected='selected'":"" %>>스키</option>
						<option value="HB09" <%="HB09".equals(hob)?"selected='selected'":"" %>>만화</option>
						<option value="HB10" <%="HB010".equals(hob)?"selected='selected'":"" %>>낚시</option>
						<option value="HB11" <%="HB011".equals(hob)?"selected='selected'":"" %>>영화감상</option>
						<option value="HB12" <%="HB012".equals(hob)?"selected='selected'":"" %>>등산</option>
						<option value="HB13" <%="HB013".equals(hob)?"selected='selected'":"" %>>개그</option>
						<option value="HB14" <%="HB014".equals(hob)?"selected='selected'":"" %>>카레이싱</option>					
					</select>				
				</td>
			</tr>
			<tr>
				<td>마일리지</td>
				<td><%=rs.getInt("mem_mileage") %></td>
			</tr>			
			<tr>
				<td>탈퇴여부</td>
				<td>
					<input type="radio" name="memDelete" value="Y" <%="Y".equals(rs.getString("mem_delete"))?"checked='checked'":"" %>>Y
					<input type="radio" name="memDelete" value="N" <%=!"N".equals(rs.getString("mem_delete"))?"checked='checked'":"" %>>N
					<%System.out.print(rs.getString("mem_delete")); %>
				</td>
			</tr>			
			<tr>
				<td colspan="2">
					<a href="memberList.jsp" class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					&nbsp; 목록
					</a>
					<button type="submit" class="btn btn-primary">
						<span class="glyphicon glyphicon-heart-empty" aria-hidden="true" ></span>
						&nbsp; 저장
					</button>
				</td>
			</tr>
		</tbody>	
	</table>
	<%
	}
	
	if(connection!=null){try{connection.close();}catch(SQLException e){e.printStackTrace();}}
	if(rs!=null){try{rs.close();}catch(SQLException e){e.printStackTrace();}}
	if(pstmt!=null){try{pstmt.close();}catch(SQLException e){e.printStackTrace();}}
	%>
	</form>
</div>

</body>
</html>