<%@page import="model.MemberDAO"%>
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
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
<%
	String id = request.getParameter("id");

	MemberDAO mdao = new MemberDAO();
	//String 으로 저장되어있는 패스워드를 가져옴(데이터베이스에서 가져온 값을 pass에 저장)
	String pass = mdao.getPass(id);
	//수정하기 위해서 작성한 패스워드 값과 기존 데이터베이스의 패스워드 값을 비교
	if(mbean.getPw1().equals(pass)){ 
		//기존 패스와 데이터베이스 패스가 같다면 MEMBER table수정
		//MemberDao클래스의 회원수정 메소드를 호출
		mdao.updateMember(mbean); //mbean안에 수정할 데이터가 있으니 그대로 인자로 넘겨준다.
		response.sendRedirect("MemberList.jsp");
	} else {
%>
		<script type="text/javascript">
			alert("패스워드가 맞지 않습니다. 다시 확인해 주세요");
			history.go(-1);
		</script>
<%	
	}
%>
</body>
</html>