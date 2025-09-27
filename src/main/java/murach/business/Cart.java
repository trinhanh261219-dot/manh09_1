package murach.business;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
    private ArrayList<LineItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public void addItem(LineItem item) {
        String code = item.getProduct().getCode();
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getCode().equals(code)) {
                lineItem.setQuantity(lineItem.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }
    public void updateItem(LineItem item) {
    String code = item.getProduct().getCode();
    for (LineItem lineItem : items) {
        if (lineItem.getProduct().getCode().equals(code)) {
            lineItem.setQuantity(item.getQuantity()); // gán trực tiếp số lượng mới
            return;
        }
    }
    items.add(item); // nếu chưa có trong giỏ thì thêm mới
}

    public void removeItem(LineItem item) {
        String code = item.getProduct().getCode();
        items.removeIf(lineItem -> lineItem.getProduct().getCode().equals(code));
    }
}
