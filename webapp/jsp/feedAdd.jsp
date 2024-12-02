<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="util.FileUtil" %>
<%@ page import="dao.FeedDAO" %>
<%
   request.setCharacterEncoding("utf-8");

   //String uid = null, ucon = null, ufname = null;
   String jsonstr = null, ufname =null;
   byte[] ufile = null;

   ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
   List items = sfu.parseRequest(request);

   Iterator iter = items.iterator();
   
   while(iter.hasNext()) {
       FileItem item = (FileItem) iter.next();
       String name = item.getFieldName();
       if(item.isFormField()) {
           String value = item.getString("utf-8");
           if(name.equals("jsonstr")) jsonstr = value;
       }
       else {
           if (name.equals("image")) {
               ufname = item.getName();
               ufile = item.get();
               String root = application.getRealPath(java.io.File.separator);
               FileUtil.saveImage(root, ufname, ufile);
               out.print("이미지 업로드가 완료되었스빈니다.");
           }
       }
   }

   
   /*try {
	    // jsonstr 값 확인
	    System.out.println("jsonstr: " + jsonstr);
	    
	    FeedDAO dao = new FeedDAO();
	    boolean result = dao.insert(jsonstr);
	    System.out.println("insert result: " + result);
	    
	    if(result) {
	        out.print("OK");
	    }
	} catch(Exception e) {
	    e.printStackTrace(); // 상세 에러 로그 확인
	    out.print("ER");
	}*/
   FeedDAO dao = new FeedDAO();
   if(dao.insert(jsonstr)){out.print("OK");}
   else{out.print("ER");}
   
   
   
   
   //if (dao.insert(uid, ucon, ufname) == true) {
	  //if (dao.insert(jsonstr)){
	   //out.print("OK");
       //response.sendRedirect("main.jsp");
       
	   //else {
       //out.print("ER");//"작성 글의 업로드 중 오류가 발생하였습니다.");
   
%>