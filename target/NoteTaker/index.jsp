<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" 
    content="width=device-width, initial-scale=1, shrink-to-fit=no">

    
    <title>Note Taker : Home page</title>
    <%@include file="all_js_css.jsp" %>
    
    
  </head>
  <body>
  
  
  <div class="container ">
  <h1> Welcome to the Ambedkar College Note Taker Application </h1>
	
  <%@include file="navbar.jsp" %>
  <br>
  
  <div class="card px-5">
  <img alt="" class="img-fluid mx-auto" style = "width:400px;"src="img/student.png">
  <h1 class="text-primary text-uppercase text-center mt-3">Start Taking your notes</h1>
  
  <li class="nav-item">
        <a class="nav-link text-center" href="add_notes.jsp">Start Here</a>
      </li>
      
      <form action ="./search.jsp">
      <input type="text" name="user"/>
      <input type="submit"/>
      </form>
  
  
  
  </div>
  <h3> Project Made by Gagan Sahare & Pratik Kayte </h3>
  
  </div>
    

    </body>
</html>