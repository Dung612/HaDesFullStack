package vn.devpro.javaweb27.controller.frontend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MenuController {
	

	@RequestMapping(value = "/signup",method = RequestMethod.GET)
	public String signup(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		String name = request.getParameter("txtname");
		System.out.println("name:" + name);
		return "frontend/menu/signup";
	}
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		return "frontend/menu/login";
	}

	@RequestMapping(value = "/recruitment",method = RequestMethod.GET)
	public String recruitment(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		return "frontend/menu/recruitment";
	}
	@RequestMapping(value = "/product-Infor",method = RequestMethod.GET)
	public String product(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		return "frontend/menu/product-Infor";
	}
}
