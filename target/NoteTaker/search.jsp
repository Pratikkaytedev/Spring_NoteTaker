<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
<table bordder="1">
<!-- <tr>
<th>id</th>
<th>title</th>
<th>content</th>
</tr> -->

<%
   String url = "jdbc:mysql://localhost:3306/notetaker";
   String username = "root";
   String password = "";
   Connection connection = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      connection = DriverManager.getConnection(url, username, password);
   } catch (Exception e) {
      e.printStackTrace();
   }
   // Use the connection to perform the search query
%>

<%
   String searchTerm = request.getParameter("searchTerm"); // Get the search term from a form or URL parameter
   
   // Create and execute the search query
   String query = "SELECT * FROM notes WHERE title LIKE ?";
   PreparedStatement statement = connection.prepareStatement(query);
   statement.setString(1, "%" + searchTerm + "%");
   ResultSet resultSet = statement.executeQuery();
   
   // Process the search results
   while (resultSet.next()) {
      // Retrieve data from the result set
      String columnName1 = resultSet.getString("title");
      String columnName2 = resultSet.getString("content");
      
      // Process the retrieved data
      
   }
   
   // Close the database resources
   
%>
<% while (resultSet.next()) { %>
   <p><%= resultSet.getString("title") %></p>
   <p><%= resultSet.getString("content") %></p>
   <!-- Display other relevant data -->
<% } %>




</table>
</center>


</body>
</html>