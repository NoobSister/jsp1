<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[3] - db 회원 등록</title>
<style>
	ul {
		list-style: none;
	}
	ul #name {
		padding: 5px 20px;
		magin: 5px;
		background-color: tomato;
		color: white;
	}
	li {
		padding: 5px 20px;
	}
</style>
</head>
<body>
	<!-- 이 파일에서는 사용자 정보를 전달 받아서 화면에 출력. 그리고 이후에는 데이터베이스에 데이터를 저장합니다. -->
	<%
		// 서버에서 데이터 처리를 위한 자바코드
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));	// Vo 객체에 저장할 때 필요합니다.
		String addr = request.getParameter("addr");
		if(addr.equals("기타")) addr = request.getParameter("addr_etc");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		String hobbies = Arrays.toString(request.getParameterValues("hobby"));
		hobbies = hobbies.substring(1, hobbies.length()-1);
		//String hobby = request.getParameter("hobby");
		// 참고 : hobby 는 배열입니다. -> getParameterValues() 메소드로 데이터를 받습니다. -> 변수 타입은 String[]
				
		String password = request.getParameter("password");
		Customer cus = new Customer(0, name, password, email, addr, gender, age, hobbies);
		CustomerDao dao = CustomerDao.getInstance();
		dao.insert(cus);
	%>
	<h3>환영합니다! WELCOME!!</h3>
	<ul>
		<li id="name"><%= name %> 님</li>
		<li>이메일 : <%= email %></li>
		<li>나이 :<%= age %>세 (<%= (gender.equals("male") ? "남":"여") %>)</li>
		<li>주소 : <%= addr %></li>
		<li>성별 : <%= gender %></li>
		<li>취미 : <%= hobbies %></li>
	</ul>
	<a href="member_list.jsp">회원 리스트</a>
</body>
</html>