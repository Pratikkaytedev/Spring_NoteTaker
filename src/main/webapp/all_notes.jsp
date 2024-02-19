<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.*"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp" %>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css?version=<%= System.currentTimeMillis() %>">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.all.min.js?version=<%= System.currentTimeMillis() %>"></script>


</head>
<body>

<div class="container">
<%@include file="navbar.jsp" %>
<br>
<h1 class="text-uppercase">All Notes:</h1>

<div class="row">
<div class="col-12">


<%
        String update = (String) session.getAttribute("update");

        if (update != null) {
    %>
        <script>
            Swal.fire({
                icon: 'info', // You can use 'success', 'warning', 'error', etc.
                title: 'Success',
                text: '<%= update %>',
                confirmButtonText: 'OK'
            });
        </script>
    <%
            session.removeAttribute("update");
        }
    %>

<%
    String delete = (String) session.getAttribute("delete");

    if (delete != null) {
%>
    <style>
        .red-swal-text {
            color: red;
        }
    </style>

    <script>
        Swal.fire({
            icon: 'error',
            title: 'Deleted',
            html: '<span class="red-swal-text"><%= delete %></span>',
            confirmButtonText: 'OK',
            customClass: {
                confirmButton: 'btn btn-danger'
            }
        });
    </script>
<%
        session.removeAttribute("delete");
    }
%>


<%
    String notes = (String) session.getAttribute("note");
  
  //System.out.println(message);

    if (notes!=null) {
        // Display SweetAlert message
%>
        <script>
            Swal.fire({
                icon: 'info', // You can use 'success', 'warning', 'error', etc.
                title: 'Success',
                text: '<%= notes %>',
                confirmButtonText: 'OK'
            });
        </script>
<%
       
        session.removeAttribute("note");
    }
%>


<%
Session s=FactoryProvider.getFactory().openSession();
Query q=s.createQuery("from Note");
List<Note> list=q.list();
for(Note note:list){
	%>
	
	<div class="card mt-3" >
  <img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/student.png" alt="Card image cap">
  <div class="card-body  px-5">
    <h5 class="card-title"><%= note.getTitle()%></h5>
    <p class="card-text">
    <%= note.getContent() %>
    </p>
    <p ><b class="text-primary"><%= note.getAddedDate() %></p>
    <div
     class= "container text-center mt-2">
    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>   
  </div>
</div>
	
<%	
}

s.close();
%>

</div>
</div>
</div>
</body>
</html>