<!DOCTYPE html>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Note Taker : Home page</title>
    <%@include file="all_js_css.jsp" %>

    <!-- ... other meta tags ... -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.min.css?version=<%= System.currentTimeMillis() %>">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.5/dist/sweetalert2.all.min.js?version=<%= System.currentTimeMillis() %>"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            color: #007bff;
            font-size: 2.5em;
            margin-top: 50px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            letter-spacing: 2px;
        }
    </style>
</head>

<body>
    <%
        String message = (String) session.getAttribute("message");

        if (message != null) {
    %>
        <script>
            Swal.fire({
                icon: 'info', // You can use 'success', 'warning', 'error', etc.
                title: 'Success',
                text: '<%= message %>',
                confirmButtonText: 'OK'
            });
        </script>
    <%
            session.removeAttribute("message");
        }
    %>

    <div class="container">
        <h1>Welcome to the Note Taker Application</h1>
        <%@include file="navbar.jsp" %>
        <br>

        <div class="card px-5">
            <img alt="" class="img-fluid mx-auto" style="width:400px;" src="img/student.png">
            <h1 class="text-primary text-uppercase text-center mt-3">Start Taking your notes</h1>

            <div class="text-center">
                <a class="btn btn-success" href="add_notes.jsp">Start Here</a>
            </div>
        </div>

        <h3 class="text-primary text-uppercase text-center mt-3">Project Made by Pratik Kayte</h3>
    </div>
</body>
</html>
