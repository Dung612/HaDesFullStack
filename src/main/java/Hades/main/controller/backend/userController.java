package Hades.main.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Hades.main.controller.BaseController;
import Hades.main.model.Category;
import Hades.main.model.Role;
import Hades.main.model.User;
import Hades.main.service.RoleService;
import Hades.main.service.UserService;

@Controller
@RequestMapping("/admin/user/")
public class userController extends BaseController {

	@Autowired
	private UserService userSevice;
	
	@Autowired
	private RoleService roleSevice;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listUser(final Model model) {
		
		List<User> listUser = userSevice.findAllUser();
		model.addAttribute("listUser", listUser);
		
		return "backend/user-list";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(final Model model) {
		List<User> listUser = userSevice.findAllUser();
		model.addAttribute("listUser", listUser);
		
		List<Role> roles = roleSevice.findAllRoleActive();
		model.addAttribute("roles", roles);
		
		User user = new User();
		user.setCreateDate(new Date());
	    model.addAttribute("user", user);
		
		return "backend/user-add";
	}
	@RequestMapping(value = "/add-save" , method = RequestMethod.POST)
	public String userAddSave(final Model model,
			@ModelAttribute("user") User user ) throws IOException{
			

		
		userSevice.saveOrUpdate(user);
		
		return "redirect:/admin/user/list";	
	}
	
	
	
	@RequestMapping(value = "edit/{userId}", method = RequestMethod.GET)
	public String edit(final Model model,
			@PathVariable("userId") int userId) {
		List<User> listUser = userSevice.findAllUser();
		model.addAttribute("listUser", listUser);
		
		List<Role> roles = roleSevice.findAllRoleActive();
		model.addAttribute("roles", roles);
		
		User user = userSevice.getById(userId);
		user.setUpdateDate(new Date());
		
		model.addAttribute("user", user);
		

		
		return "backend/user-edit";
	}
	
	@RequestMapping(value = "/edit-save" , method = RequestMethod.POST)
	public String userEditSave(final Model model,
			@ModelAttribute("user") User user ) throws IOException{
			

		
		userSevice.saveOrUpdate(user);
		
		return "redirect:/admin/user/list";	
	}
	
	@RequestMapping(value = "/delete/{userId}" , method = RequestMethod.GET)
	public String userDelete(final Model model,
			@PathVariable("userId") int userId ) throws IOException{
			//bo active
		
		User user = userSevice.getById(userId);
		user.setStatus(false);
		userSevice.inactiveUser(user);
		
		return "redirect:/admin/user/list";	
	}
}
