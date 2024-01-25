package vn.devpro.javaweb27.controller;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.web.bind.annotation.ModelAttribute;

@Configurable
public class BaseController {
	
	@ModelAttribute("title")
	public String projectTitle() {
		return "Hades";
	}
}
