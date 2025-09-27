package murach.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import murach.business.*;
import murach.data.ProductIO;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "cart"; 
        }

        String url = "/index.jsp";

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        if (action.equals("add")) {
            String productCode = request.getParameter("productCode");
            Product product = ProductIO.getProduct(productCode);

            LineItem item = new LineItem(product, 1);
            cart.addItem(item);
            url = "/cart.jsp";
        }
        else if (action.equals("update")) {
            String productCode = request.getParameter("productCode");
            String quantityString = request.getParameter("quantity");
            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
            } catch (NumberFormatException e) {
                quantity = 1;
            }
            Product product = ProductIO.getProduct(productCode);
            LineItem item = new LineItem(product, quantity);

            if (quantity > 0) {
                cart.updateItem(item);
            } else {
                 cart.removeItem(item);
            }
            url = "/cart.jsp";
        }
        else if (action.equals("remove")) {
            String productCode = request.getParameter("productCode");
            Product product = ProductIO.getProduct(productCode);
            LineItem item = new LineItem(product, 0);
            cart.removeItem(item);
            url = "/cart.jsp";
        }
        else if (action.equals("checkout")) {
            url = "/checkout.jsp";
        }

        session.setAttribute("cart", cart);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
