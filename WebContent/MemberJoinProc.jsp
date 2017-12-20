<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); //한글 처리
	//취미 부분은 별도로 읽어드려서 다시 빈클레스에 저장
	String[] hobby = request.getParameterValues("hobby");
	//배열에 있는 내용을 하나의 스트링으로 저장
	String textHobby = "";
	
	for(int i=0; i<hobby.length; i++){
		textHobby += hobby[i] + " ";
	}
%>
	<!-- useBean을 이용하여 한꺼번에 데이터를 받아옴 -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" /><!-- 전체를 맵핑시킨다 -->
	</jsp:useBean>
<%
	//기존 취미는 주소번지가 저장되기 때문에 위 배열의 내용을 하나의 String으로 저장한 변수를 다시 입력
	mbean.setHobby(textHobby); 
	//데이터베이스 클래스 객체 생성
	MemberDAO mdao = new MemberDAO();
	if(mbean.getPw1().equals(mbean.getPw2())){
		mdao.insertMember(mbean);
		//회원가입이 되었다면 회원 정보를 보여주는 페이지로 이동시킨다
		response.sendRedirect("MemberList.jsp");
	} else {
%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다");
			history.go(-1);
		</script>
<%		
	}
%>
</body>
</html>












