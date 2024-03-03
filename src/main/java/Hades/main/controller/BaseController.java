package Hades.main.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Hades.main.dto.Cart;
import Hades.main.dto.ProductCart;
import Hades.main.model.User;




@Configurable
public class BaseController {
	
	
	
	
	@ModelAttribute("title")
	public String projectTitle() {
		return "Hades";
	}
	
	@ModelAttribute("totalCartproducts")
	public BigInteger getTotalCartProducts(final HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") == null) {
			return BigInteger.ZERO;
			
		}
		Hades.main.dto.Cart cart = (Cart) session.getAttribute("cart");
		return cart.totalCartProduct();
	}
	
	//lay thong tin cua user dang nhap
	@ModelAttribute("loginedUser")
	public User getloginedUser( ) {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (loginedUser != null && loginedUser instanceof UserDetails) {
			User user = (User) loginedUser;
			return user;
		}
		return new User();
	}
	
	//kiemtra da login hay chua
	@ModelAttribute("islogined")
	public boolean isLogined( ) {
		Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (loginedUser != null && loginedUser instanceof UserDetails) {
			return true;
		}
		return false;
	}
	
	


	
}
