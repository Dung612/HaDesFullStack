package vn.devpro.javaweb27.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_sale_order_product")
public class SaleOrderProduct extends BaseModel {
	@Column(name = "quantity", nullable = true)
	private int quantity;
	
	@Column(name = "description", length = 500, nullable = true)
	private String description;
	
	/*------------------ Mapping many to one: tbl_sale_order_product-to-tbl_product -------------*/
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;
	
	/*---------------- Mapping many to one: tbl_product_image-to-tbl_sale_order ----------------*/
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sale_order_id")
    private SaleOrder saleOrder;
	
	/*---------------- Mapping many to one: tbl_product_image-to-tbl_user ----------------*/
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "create_by")
    private User userCreateSaleOrderProduct;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "update_by")
    private User userUpdateSaleOrderProduct;
	
	/*-----------------------------------------------------------------------------------------*/
	
	
	public SaleOrderProduct() {
		super();
	}

	public SaleOrder getSaleOrder() {
		return saleOrder;
	}

	public void setSaleOrder(SaleOrder saleOrder) {
		this.saleOrder = saleOrder;
	}

	public SaleOrderProduct(Integer id, Date createDate, Date updateDate, Boolean status, int quantity,
			String description, Product product, User userCreateSaleOrderProduct, User userUpdateSaleOrderProduct) {
		super(id, createDate, updateDate, status);
		this.quantity = quantity;
		this.description = description;
		this.product = product;
		this.userCreateSaleOrderProduct = userCreateSaleOrderProduct;
		this.userUpdateSaleOrderProduct = userUpdateSaleOrderProduct;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUserCreateSaleOrderProduct() {
		return userCreateSaleOrderProduct;
	}

	public void setUserCreateSaleOrderProduct(User userCreateSaleOrderProduct) {
		this.userCreateSaleOrderProduct = userCreateSaleOrderProduct;
	}

	public User getUserUpdateSaleOrderProduct() {
		return userUpdateSaleOrderProduct;
	}

	public void setUserUpdateSaleOrderProduct(User userUpdateSaleOrderProduct) {
		this.userUpdateSaleOrderProduct = userUpdateSaleOrderProduct;
	}
}
