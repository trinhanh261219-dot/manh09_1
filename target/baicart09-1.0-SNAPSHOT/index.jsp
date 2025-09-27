<%@ page import="murach.data.ProductIO" %>
<%@ page import="murach.business.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CD list</title>
    <link rel="stylesheet" type="text/css" href="styles/main.css">
</head>
<body>
<h2>CD list</h2>
<table border="1">
<tr><th>Description</th><th>Price</th><th></th></tr>
<%
    Product p1 = ProductIO.getProduct("8601");
    Product p2 = ProductIO.getProduct("pf01");
    Product p3 = ProductIO.getProduct("pf02");
    Product p4 = ProductIO.getProduct("jr01");
    Product[] products = {p1, p2, p3, p4};
    for(Product p : products) {
%>
<tr>
  <td><%= p.getDescription() %></td>
  <td>$<%= p.getPrice() %></td>
  <td>
    <form action="CartServlet" method="post">
      <input type="hidden" name="productCode" value="<%= p.getCode() %>">
      <input type="hidden" name="action" value="add">
      <input type="submit" value="Add To Cart">
    </form>
  </td>
</tr>
<% } %>
</table>
</body>
</html>
