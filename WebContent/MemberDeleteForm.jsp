<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>회원 정보 삭제하기</h2>
		<table width="400" border="1">
		<form action="MemberDeleteProc.jsp" method="post">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=request.getParameter("id")%></td>
			</tr>
			<tr height="50">
				<td align="center" width="150">패스워드</td>
				<td width="250"><input type="password" name="pw1"></td>
			</tr>
			<tr height="50">
				<td align="center" colspan="2">
					<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
					<input type="submit" value="삭제하기"> &nbsp;&nbsp;</form>
					<button onclick="location.href='MemberList.jsp'">회원 전체 보기</button>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>