package Hades.main.controller;

import java.io.IOException;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class LoginController {

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String login() throws IOException{
		
	
		return "frontend/menu/login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	//@RequestMapping : anh xa 1 action den 1 action method trong controller
	public String signup() throws IOException{
		
	
		return "frontend/menu/signup";
	}
}
