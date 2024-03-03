package Hades.main.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Hades.main.model.Product;
import Hades.main.model.Role;
import Hades.main.model.User;
import Hades.main.service.ProductService;
import Hades.main.service.RoleService;
import Hades.main.service.UserService;




@Controller
public class LoginController  extends BaseController{
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String login(final Model model) throws IOException{
	    List<Product> productsallactive = productService.findAllActive();
	    model.addAttribute("productsallactive", productsallactive);
		
	
		return "frontend/menu/login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String signup(final Model model) throws IOException{
	    List<Product> productsallactive = productService.findAllActive();
	    model.addAttribute("productsallactive", productsallactive);
		
	
		return "frontend/menu/signup";
	}
	
	@RequestMapping(value = "/register" , method = RequestMethod.POST)
	public String Register(final Model model ,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setName(request.getParameter("name"));
		user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter("mobile"));
		//set role cho user moi mac dinh la guest
		Role role = roleService.getRoleByName("Guest");
		user.addRelationalUserRole(role);
		user.setCreateDate(new Date());
		userService.saveOrUpdate(user);
		return "redirect:/login";
	}
}
