<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.FriendDAO" %>
<%@ page import="dao.FeedDAO" %>
<%@ page import="dao.FriendDAO" %>
<%
   String uid = request.getParameter("id");
   String frid = request.getParameter("frid");
   out.print((new FriendDAO()).insert(uid, frid));
%>