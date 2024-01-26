package Hades.main.controller.frontend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MenuController {
	



	@RequestMapping(value = "/recruitment",method = RequestMethod.GET)
	public String recruitment(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		return "frontend/menu/recruitment";
	}

}
