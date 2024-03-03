package Hades.main.dto;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart {
	
	//danh sach cac san pham trong gio hang
	public static List<ProductCart> productCarts = new ArrayList<ProductCart>();
	// tinh tong so san pham trong gio hang
	public BigInteger totalCartProduct() {
		BigInteger total = BigInteger.ZERO;
		for (ProductCart productCart : productCarts) {
			total = total.add(productCart.getQuantity());
		}
		return total;
	}
	
	// tinh tong so tien phai tra cho gio hang
	public static BigDecimal totalCartPrice() {
		BigDecimal total = BigDecimal.ZERO;
		for (ProductCart productCart : productCarts) {
			total = total.add(productCart.totalPrice());
		}
		return total;
	}
	
	//tim san pham trong gio hang theo id


	public List<ProductCart> getProductCarts() {
		return productCarts;
	}

	public void setProductCarts(List<ProductCart> productCarts) {
		this.productCarts = productCarts;
	}

	public int findProductById(int productId) {
		for (int index = 0; index < productCarts.size(); index++) {
			if (productCarts.get(index).getProductId()==productId) {
				return index;
			}
			
		}
		return -1;
	}
	public int findProductByIdAndSize(int id, String size) {
	    for (int index = 0; index < productCarts.size(); index++) {
	        ProductCart productCart = productCarts.get(index);
	        if (productCart.getProductId() == id && productCart.getSize().equals(size)) {
	            return index;
	        }
	    }
	    return -1;
	}



	

}
