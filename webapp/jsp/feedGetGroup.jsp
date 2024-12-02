<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%@ page import="dao.FeedDAO" %>
<%@ page import="dao.FriendDAO" %>
<%
   String frids = request.getParameter("frids");
   String maxNo = request.getParameter("maxNo");
   out.print((new FeedDAO()).getGroup(frids, maxNo));
%>