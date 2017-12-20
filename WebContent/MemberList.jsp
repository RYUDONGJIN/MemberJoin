<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1. 데이터베이스에서 모든 회원의 정보를 가져옴 /2. 테이블태그를 이용하여 화면에 회원들의 정보를 출력 -->
<%
	MemberDAO mdao = new MemberDAO();
	//회원들의 정보가 얼마나  저장되어 있는지를 모르기에 가변길이인 Vector를 이용하여 데이터를 저장
	Vector<MemberBean> vec = mdao.allSelectMember();
	request.setAttribute("vec", vec);
%>
	<center>
	<h2>모든 회원 보기</h2>
		<%-- <table width="800" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="250">이메일</td>
				<td align="center" width="200">전화번호</td>
				<td align="center" width="200">취미</td>
			</tr>
			<%
				for(int i=0; i<vec.size(); i++){
					//벡터에 담긴 bean클래스를 하나씩 추출
					MemberBean bean = vec.get(i); 
			%>
			<tr height="50">
				<td align="center" width="150">
					<a href="MemberInfo.jsp?id=<%=bean.getId()%>"><%=bean.getId()%></a>
				</td>
				<td align="center" width="250"><%=bean.getEmail()%></td>
				<td align="center" width="200"><%=bean.getTel()%></td>
				<td align="center" width="200"><%=bean.getHobby()%></td>
			</tr>
			<%
				}
			%>
		</table> --%>
		<table width="800" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="250">이메일</td>
				<td align="center" width="200">전화번호</td>
				<td align="center" width="200">취미</td>
			</tr>
			<!-- vec에서 값을 가져와서 bean에다 집어넣겠다 확장 for문처럼 쓴다 -->
			<c:forEach var="bean" items="${vec}"> 
			<tr height="50">
				<td align="center" width="150">
					<a href="MemberInfo.jsp?id=${bean.id}">${bean.id}</a>
				</td>
				<td align="center" width="250">${bean.email}</td>
				<td align="center" width="200">${bean.tel}</td>
				<td align="center" width="200">${bean.hobby}</td>
			</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>













