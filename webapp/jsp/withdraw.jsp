<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%
   request.setCharacterEncoding("utf-8");
   
   String uid = request.getParameter("id");
   
   UserDAO dao = new UserDAO();
   
   // 회원 존재 여부 확인
   if (!dao.exists(uid)) {
       out.print("NE");  // 존재하지 않는 회원
       return;
   }
   
   // 회원 탈퇴 처리
   if (dao.delete(uid)) {
       out.print("OK");  // 탈퇴 성공
   }
   else {
       out.print("ER");  // 탈퇴 실패
   }
   
   /* if ((new UserDAO()).delete(uid)) {
       out.print("회원 탈퇴가 완료되었습니다.");
   }
   else {
       out.print("회원 탈퇴 처리 중 오류가 발생하였습니다.");
   } */
%>