<%@ page language = "java" import="java.sql.*" %>

<html>
<%
String userName = request.getParameter("userName");
String password = request.getParameter("password");
String url = "jdbc:mysql://138.68.140.83/dbVeeresh";
Connection connection = null;
Statement statement = null;
ResultSet resultset = null;
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
connection = DriverManager.getConnection(url, userName, password);
statement = connection.createStatement();
String query = "select * from item";
resultset = statement.executeQuery(query);
%>
<table border="1">
<thead>
<tr>
<th>Item Id</th>
<th>Description</th>
<th>Price</th>
<th>Stock Quantity</th>
<th>Supplier Id</th>
</tr>
</thead>
<tbody>
<%
while (resultset.next())
{
String itemId = resultset.getString("Item_Id");
String description = resultset.getString("Description");
String price = resultset.getString("Price");
String stockQty = resultset.getString("Stock_Quantity");
String supplierId = resultset.getString("Supplier_Id");
%>
<tr>
<td><%= itemId %></td>
<td><%= description %></td>
<td><%= price %></td>
<td><%= stockQty %></td>
<td><%= supplierId%></td>
</tr>
<%
}
%>
</tbody>
</table>
<% String itemId = request.getParameter("userName");
String myquery = "select * from item where Item_Id = '" + itemId + "'";
out.print(myquery);
%>
<%
}
catch(ClassNotFoundException e)
{
%>
   <p><% out.println("MySQL JDBC Driver not found.");%></p>
   <%
       }
        catch (SQLException e)
       {
    %>
           <p><% out.println("Database connection error."); %>
   <%        
       }
%>
</html>
