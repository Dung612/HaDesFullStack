package Hades.main.controller.frontend;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import Hades.main.controller.BaseController;
import Hades.main.dto.Cart;
import Hades.main.dto.jw27Constant;
import Hades.main.model.Product;
import Hades.main.service.ProductService;
import Hades.main.service.SaleOrderService;
import Hades.main.dto.Customer;
import Hades.main.dto.ProductCart;
import Hades.main.model.SaleOrder;
import Hades.main.model.SaleOrderProduct;
import Hades.main.model.User;

@Controller
public class CartController extends BaseController implements jw27Constant {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	//add product cart
	@RequestMapping(value = "/add-to-cart" , method = RequestMethod.POST)
	// them 1 san pham vao gio hang
	public ResponseEntity<Map<String, Object>> addToCart(final Model model , 
			final HttpServletRequest request,
			@RequestBody ProductCart addProduct) throws IOException {
	
	HttpSession session = request.getSession();
	Cart cart = null;
	
	//lay gio hang trong session
	//kiem tra gio hang da co trong session chua
	if (session.getAttribute("cart") !=null) {//da co gio hang
		cart = (Cart)session.getAttribute("cart"); //lay gio hang
		
	}
	else { // chua co gio hang
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
	
	//lay san pham trong db
	
	Product dbProduct = productService.getById(addProduct.getProductId());
	
	//kiem tra san pham dat mua co trong gio hang chua
	
	int index = cart.findProductByIdAndSize(dbProduct.getId(),addProduct.getSize());
	if (index != -1) { // san pham da co tron gio hang
		cart.getProductCarts().get(index).setQuantity(cart.getProductCarts().get(index).getQuantity().add(addProduct.getQuantity()));
		
	}else {// san pham chua co trong gio hang
		addProduct.setProductName(dbProduct.getName());
		addProduct.setAvatar(dbProduct.getAvatar());
		
		
		
		
		BigDecimal priceToAdd = dbProduct.getSalePrice() != null ? dbProduct.getSalePrice() : dbProduct.getPrice();
	    addProduct.setPrice(priceToAdd);
		cart.getProductCarts().add(addProduct);
		
	}
	
	//thiet lap lai gio hang
	session.setAttribute("cart", cart);
	
	//tra ve du lieu cho view
	Map<String, Object> jsonResult = new HashMap<String, Object>();
	jsonResult.put("code", 200);
	jsonResult.put("totalCartProducts", cart.totalCartProduct());
	jsonResult.put("cartProducts", cart.getProductCarts());

	jsonResult.put("message", " da them san pham vao gio hang" + addProduct.getProductName() + " vao gio hang");
	
	return ResponseEntity.ok(jsonResult);
}
	
	
	@RequestMapping(value = "/thanhtoan", method = RequestMethod.GET)
	public String thanhtoan( final Model model , final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart)session.getAttribute("cart");
			model.addAttribute("totalCartPrice" , cart.totalCartPrice());
			String message = "co tong cong " + cart.totalCartProduct() + " trong gio hang";
			model.addAttribute("message",message);
			
			
		}else {
			String erorrMessage = "khong co san pham nao trong gio hang";
			model.addAttribute("erorrMessage",erorrMessage);
		}
		return "frontend/menu/thanhtoan";
	}
	
	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView( final Model model , final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart)session.getAttribute("cart");
			model.addAttribute("totalCartPrice" , cart.totalCartPrice());
			String message = "co tong cong" + cart.totalCartProduct() + " trong gio hang";
			model.addAttribute("message",message);
			
			
		}else {
			String erorrMessage = "khong co san pham nao trong gio hang";
			model.addAttribute("erorrMessage",erorrMessage);
		}
		return "frontend/menu/giohang";
	}
	@RequestMapping(value ="/update-product-quantity", method =RequestMethod.POST)
	ResponseEntity<Map<String, Object>> updateProductQuantity(
			@RequestBody ProductCart productCart,
			final HttpServletRequest request) throws IOException{
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
		
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart)session.getAttribute("cart");
		// cap nhat so luong	
		int index = cart.findProductByIdAndSize(productCart.getProductId(), productCart.getSize());
		BigInteger oldQuantity = cart.getProductCarts().get(index).getQuantity();
		BigInteger newQuantity = oldQuantity.add(productCart.getQuantity());//+1/-1
		if (newQuantity.intValue() <1) {
			newQuantity = BigInteger.ONE;
			}
		cart.getProductCarts().get(index).setQuantity(newQuantity);
		jsonResult.put("newQuantity", newQuantity);
		}
		jsonResult.put("productId", productCart.getProductId());
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value ="/place-order", method =RequestMethod.POST)
	ResponseEntity<Map<String, Object>> placeOder(
			@RequestBody Customer customer,
			final HttpServletRequest request) throws IOException{
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		
		//kiem tra thong tin customer bat buoc
		if (StringUtils.isEmpty(customer.getTxtName())) {
			jsonResult.put("message", "ban chua nhap ho ten");
		} else if (StringUtils.isEmpty(customer.getTxtMobile())) {
			jsonResult.put("message", "ban chua nhap so dien thoai");
		}
		else {
			HttpSession session = request.getSession();
			if (session.getAttribute("cart") == null) {
				jsonResult.put("message","ban chua co gio hang");
			}
			else {
				Cart cart = (Cart)session.getAttribute("cart");
				//luu cac san pham trong gio hang vao tbl_sale_order_product
				SaleOrder saleOrder = new SaleOrder();
				for (ProductCart productCart : cart.getProductCarts()) {
					SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
					//lay product trong db
					Product dbProduct = productService.getById(productCart.getProductId());
					saleOrderProduct.setProduct(dbProduct);
					saleOrderProduct.setQuantity(productCart.getQuantity().intValue());
					saleOrderProduct.setSize(productCart.getSize());
					
					saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);
					
					
				}
				//luu don hang vao tbl_sale_order
				Calendar cal = Calendar.getInstance();
				String code = cal.get(Calendar.YEAR) + cal.get(Calendar.MONTH) + cal.get(Calendar.DAY_OF_MONTH) + customer.getTxtMobile();
				
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
					User currentUser = (User) authentication.getPrincipal();

				    // Sử dụng thông tin về người dùng để thiết lập userCreateSaleOrder trong saleOrder
				    saleOrder.setUserCreateSaleOrder(currentUser);
				} 
				
				
				saleOrder.setCode(code);
				User user = new User();
				user.setId(1);
				saleOrder.setUser(user);
				saleOrder.setCreateDate(new Date());
				
				
				
				saleOrder.setCustomerName(customer.getTxtName());
				saleOrder.setCustomerEmail(customer.getTxtEmail());
				saleOrder.setCustomerAddress(customer.getTxtAddress());
				saleOrder.setCustomerMobile(customer.getTxtMobile());
				
				saleOrder.setTotal(cart.totalCartPrice());
				saleOrder.setStatus(false);
				
				saleOrderService.saveOrder(saleOrder);
				
				
				jsonResult.put("message", "ban da dat hang thanh cong");
				cart = new Cart();
				session.setAttribute("cart", cart);
				
			}
		}
		
		return ResponseEntity.ok(jsonResult);

	}
	
	
	@RequestMapping(value = "/remove-from-cart", method = RequestMethod.POST)
	// Xóa một sản phẩm khỏi giỏ hàng
	public ResponseEntity<Map<String, Object>> removeFromCart(final HttpServletRequest request,
			@RequestBody ProductCart removeProduct) {

	    HttpSession session = request.getSession();
	    Cart cart = (Cart) session.getAttribute("cart");

	    if (cart != null) {
	        int index = cart.findProductByIdAndSize(removeProduct.getProductId(), removeProduct.getSize());
	        if (index != -1) {
	            cart.getProductCarts().remove(index);
	            // Cập nhật lại giỏ hàng trong session
	            session.setAttribute("cart", cart);

	            // Trả về thông tin sau khi xóa
	            Map<String, Object> jsonResult = new HashMap<String, Object>();
	            jsonResult.put("code", 200);
	            jsonResult.put("totalCartProducts", cart.totalCartProduct());
	            jsonResult.put("cartProducts", cart.getProductCarts());
	            jsonResult.put("message", "Đã xóa sản phẩm khỏi giỏ hàng");

	            return ResponseEntity.ok(jsonResult);
	        }
	    }

	    // Trả về thông báo nếu sản phẩm không tồn tại trong giỏ hàng hoặc giỏ hàng không tồn tại
	    Map<String, Object> jsonResult = new HashMap<String, Object>();
	    jsonResult.put("code", 404);
	    jsonResult.put("message", "Không tìm thấy sản phẩm trong giỏ hàng");

	    return ResponseEntity.status(HttpStatus.NOT_FOUND).body(jsonResult);
	}


}
