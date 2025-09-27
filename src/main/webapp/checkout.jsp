<%@ page import="murach.business.Cart" %>
<%@ page import="murach.business.LineItem" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Checkout Summary</title>
    <link rel="stylesheet" type="text/css" href="styles/main.css">

</head>
<body>
<h2>Checkout Summary</h2>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    double total = 0;
%>
<table border="1">
<tr><th>Quantity</th><th>Description</th><th>Amount</th></tr>
<%
    for (LineItem item : cart.getItems()) {
        total += item.getTotal();
%>
<tr>
  <td><%= item.getQuantity() %></td>
  <td><%= item.getProduct().getDescription() %></td>
  <td>$<%= item.getTotal() %></td>
</tr>
<% } %>
</table>
<p><b>Total Amount:</b> $<%= total %></p>
<p>Click on the browser's Back button to continue.</p>
<form action="index.jsp" method="post">
  <input type="submit" value="Back Home">
</form>
</body>
</html>
