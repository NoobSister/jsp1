<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		// 1) 추가된 회원정보만 확인하기. 요청 전달. 아래 2개의 명령어가 항사 같이 나옵니다.
		//request.setAttribute("cus", cus);
		//pageContext.forward("registration_view.jsp");
		// 2) 사용자가 요청하지 않았지만 회원리스트 list.jsp로 요청 바꾸기. 현재 registration.jsp 에서 list.jsp로 변경.
		response.sendRedirect("list.jsp");	// 응받을 보낼 때 새롭게 요청될 url 또는 파일을 지정합니다.
		/// 응답 객체로 실행합니다.
	%>