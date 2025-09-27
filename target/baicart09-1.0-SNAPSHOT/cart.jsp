<%@ page import="murach.business.Cart" %>
<%@ page import="murach.business.LineItem" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Your cart</title>
    <link rel="stylesheet" type="text/css" href="styles/main.css">

</head>
<body>
<h2>Your cart</h2>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if(cart != null && cart.getItems().size() > 0) {
%>
<table border="1">
<tr><th>Quantity</th><th>Description</th><th>Price</th><th>Amount</th><th></th></tr>
<%
    for (LineItem item : cart.getItems()) {
%>
<tr>
  <td>
    <form action="CartServlet" method="post">
      <input type="text" name="quantity" value="<%= item.getQuantity() %>" size="2">
      <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
      <input type="hidden" name="action" value="update">
      <input type="submit" value="Update">
    </form>
  </td>
  <td><%= item.getProduct().getDescription() %></td>
  <td>$<%= item.getProduct().getPrice() %></td>
  <td>$<%= item.getTotal() %></td>
  <td>
    <form action="CartServlet" method="post">
      <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
      <input type="hidden" name="action" value="remove">
      <input type="submit" value="Remove Item">
    </form>
  </td>
</tr>
<% } %>
</table>
<p>To change the quantity, enter the new quantity and click on the Update button</p>
<form action="index.jsp" method="post">
  <input type="submit" value="Continue Shopping">
</form>
<form action="CartServlet" method="post">
  <input type="hidden" name="action" value="checkout">
  <input type="submit" value="Checkout">
</form>
<%
    } else {
        out.print("<p>Your cart is empty.</p>");
%>
<form action="index.jsp" method="post">
  <input type="submit" value="Continue Shopping">
</form>
<% } %>

</body>
</html>
