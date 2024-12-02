<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
   request.setCharacterEncoding("utf-8");
   
   String uid = request.getParameter("id");
   //String upass = request.getParameter("ps");
   //String uname = request.getParameter("name");
   String jsonstr = request.getParameter("jsonstr");
   
   UserDAO dao = new UserDAO();
   
// 기존 회원 확인
   if (dao.exists(uid)) {
       out.print("EX");  // 이미 존재하는 회원
       return;
   }
   
   // 회원 가입 처리
   if (dao.insert(uid, jsonstr)) {
	   session.setAttribute("id",uid);
	   out.print("OK");  // 가입 성공
   }
   else {
       out.print("ER");  // 가입 실패
   }
   
   
   
   
   /* if (dao.exists(uid)) {
       out.print("이미 가입한 회원입니다.");
       return;
   } */
   
  	/* if (dao.insert(uid, upass, uname)){
	   session.setAttribute("id",uid);
	   response.sendRedirect("main.jsp");
   } */
   
	/* if (dao.insert(uid, upass, uname) == true) {
	       out.print("회원 가입이 완료되었습니다.");
	 } 
  
   else {
       out.print("회원 가입 중 오류가 발생하였습니다.");
   } */
%>