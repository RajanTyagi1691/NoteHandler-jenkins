<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes : Note Handler</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>

<div class="container">
<%@include file="navbar.jsp" %>
<br>
<h1 class="text-uppercase ">All Notes :</h1>
 
 <div class ="row">
 <div class ="col-12">

<%
Session s=FactoryProvider.getFactory().openSession();
Query q=s.createQuery("From Note");  
List<Note> list=q.list();
for(Note note:list)
{%>
	
	<div class="card mt-3" >
	  <img class="card-img-top m-2 p-0"  style="max-width:50px" src="img/notes.png" alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title"><%= note.getTitle() %></h5>
	    <p class="card-text"> 
	    <%=note.getContent() %>
	    </p>
	    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
	    <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
	  </div>
	</div>
	 
 
 <%}



s.close();
%>

 </div>
 </div>

</div>
 
</body>
</html>