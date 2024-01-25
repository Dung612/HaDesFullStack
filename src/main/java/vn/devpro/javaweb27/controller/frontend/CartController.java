package vn.devpro.javaweb27.controller.frontend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.javaweb27.controller.BaseController;
import vn.devpro.javaweb27.dto.Cart;
import vn.devpro.javaweb27.dto.jw27Constant;
import vn.devpro.javaweb27.service.ProductService;
import vn.devpro.javaweb27.service.SaleOrderService;
@Controller
public class CartController extends BaseController implements jw27Constant {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	
	
	@RequestMapping(value = "/cart-view", method = RequestMethod.GET)
	public String cartView( final Model model , final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart)session.getAttribute("cart");
			model.addAttribute("totalCartPrice" , cart.totalCartPrice());
			String message = "co tong cong" + cart.totalCartProduct() + " tron gio hang";
			model.addAttribute("message",message);
			
			
		}else {
			String erorrMessage = "khong co san pham nao trong gio hang";
			model.addAttribute("erorrMessage",erorrMessage);
		}
		return "frontend/menu/thanhtoan";
	}

}
