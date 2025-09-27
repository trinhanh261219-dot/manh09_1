package murach.business;

import java.io.Serializable;

public class LineItem implements Serializable {
    private Product product;
    private int quantity;

    public LineItem() {
    }

    public LineItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public void setProduct(Product p) { this.product = p; }
    public Product getProduct() { return product; }

    public void setQuantity(int quantity) { this.quantity = quantity; }
    public int getQuantity() { return quantity; }

    public double getTotal() {
        return product.getPrice() * quantity;
    }
}
